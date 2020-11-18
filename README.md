# Ruby Object Relationships

## Summary

### HAS MANY

    This type of relationship reflects the idea that the instance of one class owns multiple instances of another class. A team has many players, a doctor has many appointments, etc.

    The parent/owning class will have a pluralized instance method where to access all the instances it “possesses”. E.g. Team will have the instance method #players (and maybe #add_player). Doctor will have an instance method called #appointments (and maybe #add_appointment). Now that you have a better understanding, it is important to point out that we have to respect the Single Source of Truth principle (SST). That means that the has_many class will have a pluralized getter and delegate to the belongs_to class to build the connection. For example, Doctor will have #appointments and rather than retrieving a locally created instance variable @appointments, it will:

    1) Access the Appointment class -> Appointment
    2) Get all the appointment instances ever created -> Appointment.all
    3) Filter/select only the appointments by the current doctor instance -> Appointment.all.select {|appointment| appointment.doctor == self }

### BELONGS TO

    This relationship is opposite of the has many: an appointment belongs to a doctor and a player belongs to a team.
    The child/owned class will have a singular instance method to set/retrieve the relationship with the instance that possesses them. E.g. Player will have the instance methods called #team and #team=.
    Now that you have a better understanding, it is important to point out that we have to respect the Single Source of Truth principle (SST). The belongs_to class is in charge of building the association since its instances only belong to a unique instance of the owner class. For example, when we use team= inside the Player class to assign a team to a player, the association is reflected also for the Team class since its #players method filters the list of all players by team.

### HAS MANY THROUGH

    This relationship describes the connection between three classes. These three classes are not all directly interconnected with each other. Each pair has a direct connection and then one of the three classes serves as a bridge between the other two. E.g: Doctor has many appointments. Patient has many appointments. An appointment belongs to both a doctor and a patient. Even if the Doctor and the Patient class do not have a direct connection, they can access each other’s information thanks to the Appointment class serving as a bridge between them!
    In the Appointment class you will likely see the #doctor and #patient accessors (#doctor and #doctor=, #patient and #patient=), while inside the other two classes you will likely see the #appointments getter method (and maybe #add_appointment).

### Today's example dives deeper into the has many through relationship and reviews the concepts listed above. In the terminal, make sure you run `ruby run.rb` to see the result of the associations and play with them within pry!
