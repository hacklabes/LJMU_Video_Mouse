import processing.video.*;

// this is the number of video files in the data/ directory
int NUMBER_OF_FILES = 5;

// the name of the video files should begin with this
String VIDEO_FILE_PREFIX = "movie";

// the video file extension
String VIDEO_FILE_EXTENSION = ".mp4";

Movie movie;
int counter = 0;

void setup() {
  size(640, 360);
  movie = new Movie(this, dataPath(VIDEO_FILE_PREFIX+counter+VIDEO_FILE_EXTENSION));
  movie.jump(movie.duration());
}

void draw() {
  background(0);
  if (movie.available() == true) {
    movie.read();
  }
  image(movie, 0, 0);
}

void mousePressed() {
  if (abs(movie.time() - movie.duration()) < 0.1) {
    File f = new File(dataPath(VIDEO_FILE_PREFIX+counter+VIDEO_FILE_EXTENSION));
    while (!f.exists ()) {
      counter = (counter+1)%NUMBER_OF_FILES;
      f = new File(dataPath(VIDEO_FILE_PREFIX+counter+VIDEO_FILE_EXTENSION));
    }
    movie = new Movie(this, dataPath(VIDEO_FILE_PREFIX+counter+VIDEO_FILE_EXTENSION));
    movie.play();
    counter = (counter+1)%NUMBER_OF_FILES;
  } else {
    print("click ignored: ");
    println(movie.time() +" out of "+ movie.duration());
  }
}

