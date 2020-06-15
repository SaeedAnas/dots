mod song_display {

    pub use std::{ops::Range, process::Command, str, thread, time};

    // Config
    const MILLIS: u64 = 800;
    const DISPLAY_LEN: usize = 20;
    const STEP: usize = 2;

    pub struct Song {
        name: Name,
        status: String,
    }

    pub enum State {
        Normal,
        Restarting,
    }

    pub struct Name {
        name: String,
        full: Vec<char>,
        start: usize,
        end: usize,
        state: State,
    }

    impl Song {
        fn new() -> Song {
            let (name, status) = fetch();

            Song {
                name: Name::new(name),
                status,
            }
        }

        pub fn update(&mut self) {
            let (name, status) = fetch();

            if self.name.name != name {
                self.name = Name::new(name);
            }
            self.status = status;

            self.name.update();
        }
    }

    impl Name {
        fn new(name: String) -> Name {
            let mut full = name.chars().collect::<Vec<_>>();

            // Make sure full is always even
            if full.len() % 2 != 0 {
                full.push(' ');
            }

            Name {
                name,
                full,
                start: 0,
                end: DISPLAY_LEN,
                state: State::Normal,
            }
        }

        fn set_range(&mut self, start: usize, end: usize) {
            self.start = start;
            self.end = end;
        }

        fn update(&mut self) {
            let start = self.start;
            let end = self.end;

            let len = self.full.len();

            if len < DISPLAY_LEN {
                self.set_range(0, len);
            } else if len > end {
                self.set_range(start + STEP, end + STEP);
            } else if len + DISPLAY_LEN > end {
                self.set_range(start + STEP, end + STEP);
                self.state = State::Restarting;
                return;
            } else {
                self.set_range(0, DISPLAY_LEN);
            }

            self.state = State::Normal;
        }

        fn slice(&mut self) -> String {
            self.slice_from_range(self.start..self.end)
        }

        fn slice_from_range(&mut self, r: Range<usize>) -> String {
            self.full[r.start..r.end]
                .iter()
                .cloned()
                .collect::<String>()
        }
    }

    fn fetch() -> (String, String) {
        let name = Command::new("/bin/playerctl")
            .arg("metadata")
            .arg("--format")
            .arg("'{{title}}'")
            .output()
            .expect("failed to execute process");

        let status = Command::new("/bin/playerctl")
            .arg("metadata")
            .arg("--format")
            .arg("{{lc(status)}}")
            .output()
            .expect("failed to execute process");

        let mut name = match str::from_utf8(&name.stdout) {
            Ok(v) => v.trim().to_string(),
            Err(e) => panic!("Invalid UTF-8 sequence: {}", e),
        };

        let status = match str::from_utf8(&status.stdout) {
            Ok(v) => v.trim().to_string(),
            Err(e) => panic!("Invalid UTF-8 sequence: {}", e),
        };

        name.retain(|c| !r#"(),"'"#.contains(c));

        (name, status)
    }

    fn print_json(text: &String, class: &String) {
        println!("{{\"text\": \"{}\", \"class\": \"{}\"}}", text, class);
    }

    fn display(song: &mut Song) {
        let s = match song.name.state {
            State::Normal => song.name.slice(),
            State::Restarting => {
                let diff = (song.name.end - song.name.full.len()) - STEP;
                let end = song
                    .name
                    .slice_from_range(song.name.start..song.name.full.len());
                let start = song.name.slice_from_range(0..diff);
                end + "  " + &start
            }
        };

        print_json(&s, &song.status);
    }

    pub fn start() {
        let interval = time::Duration::from_millis(MILLIS);

        let mut song = Song::new();

        loop {
            song.update();

            display(&mut song);

            thread::sleep(interval);
        }
    }
}

fn main() {
    song_display::start();
}
