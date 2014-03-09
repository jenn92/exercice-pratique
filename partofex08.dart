part of ex08;

//8.1 Make some random sentences

List doSentence (List noun, List verb, List adverb, List adjective) {
  
  List randomsentence = new List();
  Random order = new Random();
  
  for (int n = 0; n < 5; n++) {
    String start = "";
    start = '\n' + start + noun.elementAt(order.nextInt(noun.length)) + " ";
    start = start + verb.elementAt(order.nextInt(verb.length)) + " ";
    start = start + adverb.elementAt(order.nextInt(adverb.length)) + " ";
    start = start + adjective.elementAt(order.nextInt(adjective.length)) + '\n' ;
    randomsentence.add(start);
  }
  return randomsentence;
} 

//8.2.1 Sort by last name

sortbylastname(var members) {
  List lastName = new List();
  for (var n = 0; n < members.length; n++) {
    lastName.add(members[n]['lastName']);
  }
  for (var n = 1; n < lastName.length; n++){
    var x;
    var y = new Map ();
    var z;
    x = lastName[n];
    y = members[n];
    z = n;
    while (z >= 1 && lastName[z-1].compareTo(x) > 0){
  lastName[z] = lastName [z - 1];
  members[z] = members[z - 1];
  z = z - 1;
  }
  lastName[z] = x;
  members[z] = y;
  }
  print(members);
}

//8.2.2 sort by first name

sortbyfirstname(var members) {
  List firstName = new List();
  for (var n = 0; n < members.length; n++) {
    firstName.add(members[n]['firstName']);
  }
  for (var n = 1; n < firstName.length; n++){
    var x;
    var y = new Map ();
    var z;
    x = firstName[n];
    y = members[n];
    z = n;
    while (z >= 1 && firstName[z-1].compareTo(x) > 0){
  firstName[z] = firstName [z - 1];
  members[z] = members[z - 1];
  z = z - 1;
  }
  firstName[z] = x;
  members[z] = y;
  }
  print(members);
}

//sort by given letter

byletter (members, givenletter){
  List letter = new List();
  for (var n = 0; n < members.length; n++){
    Map membersbyletter = members[n];
    var lastName = membersbyletter["lastName"];
    if(lastName.startsWith(givenletter)) {
      letter.add(membersbyletter);
          }
  }
  print(letter);
}
//8.3

printMatrix(var matrix){
  for(var u in matrix){
    print(u);}
}

addMember(var associationName, var firstName, var lastName, var email, var memberList){
  memberList.add({
    'associationName': associationName,
    'firstName': firstName,
    'lastName': lastName,
    'email': email});
  print('Add a member : $firstName $lastName'); printMatrix(memberList); print('');
}

removeMember(var firstName, var lastName, var memberList){
  for(var u = 0; u < memberList.length; u++){
    if(memberList[u]['firstName'] == firstName && memberList[u]['lastName'] == lastName){
      memberList.removeAt(u);}}
  print('Remove a member : $firstName $lastName'); printMatrix(memberList); print('');
}

updateMember(var associationName, var firstName, var lastName, var email, var memberList){
  for(var u = 0; u < memberList.length; u++){
    if(memberList[u]['firstName'] == firstName && memberList[u]['lastName'] == lastName){
      memberList[u]['associationName'] = associationName;
      memberList[u]['firstName'] = firstName;
      memberList[u]['lastName'] = lastName;
      memberList[u]['email'] = email; }}
  print('Update member : $firstName $lastName'); printMatrix(memberList); print('');
}

isAMember(var firstName, var lastName, var listOfMembers){
  for(var u in listOfMembers){
    if(u['firstName'] == firstName && u['lastName'] == lastName)
      return true;}
  return false;
}

//8.4
//8.4 Write an algorithm that will find the groups of 1s(serie of 1 connected in any directions)

List<List<String>> matrix =
[['1', '0', '0', '1'],
['0', '1', '1', '0'],
['0', '0', '1', '0'],
['1', '0', '1', '0'],
['1', '0', '1', '0'],
['1', '0', '0', '1']];

findGroups(var matrice){
  var possibleGroupIs = 'abcdefghijklmnopqrstuvwxyz';
  var index = 0;
  var currentGroupIs = possibleGroupIs[index];
  var boolMatrice = createFilledBoolMatrix(matrice[0].length, matrice.length, false);
  printMatrix(matrice);
  print('');
  for(var i = 0; i < matrice.length; i++){
    for(var j = 0; j < matrice[i].length; j++){
      if(matrice[i][j] == '1'){
        findConnexion(i ,j, matrice, boolMatrice, currentGroupIs);
        index++;
        currentGroupIs = possibleGroupIs[index];}}}
  printMatrix(matrice);
  print('');
}
findConnexion(var i, var j, var matrice, var Matrice2, var groupIs){
  if(    0 <= i && i < matrice.length
      && 0 <= j && j < matrice[0].length){
    if(Matrice2[i][j] == false){
      Matrice2[i][j] = true;
      if(matrice[i][j] == '1'){
        matrice[i][j] = groupIs;
        findConnexion(i-1, j, matrice, Matrice2, groupIs);
        findConnexion(i-1, j-1, matrice, Matrice2, groupIs);
        findConnexion(i-1, j+1, matrice, Matrice2, groupIs);
        findConnexion(i, j+1, matrice, Matrice2, groupIs);
        findConnexion(i, j-1, matrice, Matrice2, groupIs);
        findConnexion(i+1, j-1, matrice, Matrice2, groupIs);
        findConnexion(i+1, j+1, matrice, Matrice2, groupIs);
        findConnexion(i+1, j, matrice, Matrice2, groupIs);}}}
}
createFilledBoolMatrix(var i, var j, var k){
  var secondMatrix = new List<List<bool>>.generate(j, (_) => new List<bool>.filled(i, k), growable: false);
  return secondMatrix;
}
//8.5 Puzzle


int randomInt(int max) => new Random().nextInt(max);

class Cell {
  int number;
  int row, column;
  bool empty = false;

  Cell(this.row, this.column);

  bool intersects(int row, int column) {
    if (this.row == row && this.column == column) {
      return true;
    }
    return false;
  }

  bool exchange(Cell cell) {
    var x = column;
    var y = row;
    row = cell.row;
    column = cell.column;
    cell.row = y;
    cell.column = x;
  }

  String toString() {
    if (empty) {
      return '       ';
    } else {
      if (number > 9) return '${number}(${row},${column})';
      else return ' ${number}(${row},${column})';
    }
  }
}

class Cells {
  List<Cell> list;

  Cells() {
    list = new List<Cell>();
  }

  void add(Cell cell) {
    list.add(cell);
  }

  Iterator get iterator => list.iterator;

  Cell cell(int n) {
    for (var cell in list) {
      if (cell.number == n) return cell;
    }
  }
}

class Puzzle {
  static final int MAX_LENGTH = 4;
  static final int EXCHANGE_LIMIT = 10000;
  int length;
  Cell emptyCell;
  Cells cells;
  int exchangeCount = 0;

  Puzzle(this.length) {
    if (length > MAX_LENGTH) {
      throw new Exception('Puzzle length must be less than ${MAX_LENGTH + 1}.');
    }
    cells = new Cells();
    var row = randomInt(length);
    var column = randomInt(length);
    emptyCell = new Cell(row, column);
    emptyCell.empty = true;
    cells.add(emptyCell);
    Cell cell;
    for (var row = 0; row < length; row++) {
      for (var column = 0; column < length; column++) {
        cell = getCell(row, column);
        if (cell == null) {
          cell = new Cell(row, column);
          cell.number = randomAvailableNumber(size);
          cells.add(cell);
        }
      }
    }
  }

  int get size => length * length;

  Cell getCell(int row, int column) {
    for (Cell cell in cells) {
      if (cell.intersects(row, column)) {
        return cell;
      }
    }
  }

  bool isNumberAvailable(int number) {
    for (Cell cell in cells) {
      if (cell != null && cell.number == number) {
        return false;
      }
    }
    return true;
  }

  int randomAvailableNumber(int max) {
    var number;
    do {
      number = randomInt(max);
    } while (!isNumberAvailable(number) || number == 0);
    return number;
  }

  bool get solved {
    var number = 0;
    var cell = getCell(length - 1, length - 1);
    if (!cell.empty) return false;
    for (var row = 0; row < length; row++) {
      for (var column = 0; column < length; column++) {
        cell = getCell(row, column);
        if (!cell.empty) {
          if (cell.number != ++number) {
            return false;
          }
        }
      }
    }
    return true;
  }

  solve() {
    if (!solved) {
      exchange();
    }
  }

  bool exchange() {
    var cell;
    do {
      var r = randomInt(4);
      switch (r) {
        case 0:
          cell = exchangeDown();
          break;
        case 1:
          cell = exchangeLeft();
          break;
        case 2:
          cell = exchangeUp();
          break;
        case 3:
          cell = exchangeRight();
          break;
      }
    } while (cell == null);
    exchangeCount++;
    display('');
    if (solved) {
      print('Solved after $exchangeCount exchanges.');
      return true;
    } else if (exchangeCount < EXCHANGE_LIMIT) {
      return exchange();
    } else {
      print('Stopped after $EXCHANGE_LIMIT exchanges.');
    }
  }

  Cell exchangeUp() {
    var upc = upCell();
    if (upc != null) {
      emptyCell.exchange(upc);
      return upc;
    }
  }

  Cell exchangeDown() {
    var downc = downCell();
    if (downc != null) {
      emptyCell.exchange(downc);
      return downc;
    }
  }

  Cell exchangeLeft() {
    var leftc = leftCell();
    if (leftc != null) {
      emptyCell.exchange(leftc);
      return leftc;
    }
  }

  Cell exchangeRight() {
    var rightc = rightCell();
    if (rightc != null) {
      emptyCell.exchange(rightc);
      return rightc;
    }
  }

  Cell upCell() {
    var row = emptyCell.row;
    var column = emptyCell.column;
    var upRow = row - 1;
    if (upRow >= 0) return getCell(upRow, column);
  }

  Cell downCell() {
    var row = emptyCell.row;
    var column = emptyCell.column;
    var downRow = row + 1;
    if (downRow <= length - 1) return getCell(downRow, column);
  }

  Cell leftCell() {
    var row = emptyCell.row;
    var column = emptyCell.column;
    var leftColumn = column - 1;
    if (leftColumn >= 0) return getCell(row, leftColumn);
  }

  Cell rightCell() {
    var row = emptyCell.row;
    var column = emptyCell.column;
    var rightColumn = column + 1;
    if (rightColumn <= length - 1) return getCell(row, rightColumn);
  }

  display(String title) {
    print(title);
    print('count: $exchangeCount');
    for (var row = 0; row < length; row++) {
      var line = '';
      for (var column = 0; column < length; column++) {
        var cell = getCell(row, column);
        line = '$line ${cell.toString()}';
      }
      print(line);
    }
    print('----------------');
  }
}
