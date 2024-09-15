class Room {
  String id;
  double price;
  DateTime date = DateTime(0);
  bool isEmpty = true;
  late Client resident;

  Room(this.id, this.price) {}
  set_empty() {
    isEmpty = true;
    date = DateTime(0);
  }

  set_occupied(DateTime new_date, Client client) {
    isEmpty = false;
    date = new_date;
    resident = client;
  }
}

class Client {
  String name;
  String phone;
  String payment_info;
  late String room_id;

  Client(this.name, this.phone, this.payment_info) {}
  assign_room(Room room, DateTime date) {
    this.room_id = room.id;
    room.set_occupied(date, this);
  }

  check_out() {}
}



class Hotel {
  List<Room> rooms = [];
  List<Client> clients = [];
  add_room() {}
  add_client() {}
}
