class Attractor {
    float mass;
    float G;
    PVector location;

    Attractor() {
        location = new PVector( width/2, height/2 );
        mass = 1;
        G = 1;

    }

    PVector attract(Mover m) {

        PVector force = PVector.sub(location, m.location);

        float distance = force.mag();

        distance = constrain(distance, 5.0, 25.0); // エンが制御不能にならないように距離を制限

        force.normalize();

        float strength = (G * mass * m.mass) / (distance * distance);

        return force;
    }



    void display() {
        stroke(0);
        fill(175, 200);
        ellipse(location.x, location.y, mass * 2, mass * 2);

    }

}