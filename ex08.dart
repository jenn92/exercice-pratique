library ex08;

import 'dart:math';

part 'partofex08.dart';

void main () {
  //ex
  List nounList = ["sister", "mother", "brother", "father", "friend"];
    List verbList = ["is", "reacts", "seems", "looks", "appears"];
    List adverbList = ["carefuly", "very", "faithfuly", "slowly", "probably", "manly", "fastly", "softly", "roughly" ];
    List adjectiveList = ["cute", "beautiful", "awesome", "nice", "handsome", "intelligent", "lovely"];
    
  List finalList = doSentence(nounList, verbList, adverbList, adjectiveList);
  print ("8.1 Here is some random sentences : \n ${finalList}");
  print("");
  
  // 8.2
  print('8.2.1 Create a list of members sort by...');
  var associations = [
    {'name': 'IS', 'description': 'Information Systems'},
    {'name': 'CS', 'description': 'Computer Science'},];

  var members = [
    {'associationName': 'IS', 'firstName': 'Dzenan', 'lastName': 'Ridjanovic', 'email': 'dr@gmail.com'},
    {'associationName': 'CS', 'firstName': 'David', 'lastName': 'Curtis', 'email': 'dc@gmail.com'},
    {'associationName': 'IS', 'firstName': 'Robert', 'lastName': 'Nelson', 'email': 'rn@gmail.com'}];
  
  print('Last name : ');
  sortbylastname(members);
  print("");
  print('First name : ');
  sortbyfirstname(members);
  print("");
  print('8.2.2 Obtain members whose last name starts with a given letter (C in this case) : ');
  var givenletter = 'C';
  byletter(members, givenletter);
  print("");
  
  
  //8.3 Create a class model with a list of associations and a list of members
  
  print('8.3 Maintenance of a class');
  print("");
  print('Model class : ');
  print('{associationName : IS, firstName: Dzenan, lastName: Ridjanovic, email: dr@gmail.com} \n{associationName : CS, firstName: David, lastName: Curtis, email: dc@gmail.com} \n{associationName: IS, firstName: Robert, lastName: Nelson, email : rn@gmail.com}');
  print("");
  List<Map> members2 = [ 
                         {'associationName': 'IS', 'firstName': 'Dzenan', 'lastName': 'Ridjanovic', 'email': 'dr@gmail.com'},
                         {'associationName': 'CS', 'firstName': 'David', 'lastName': 'Curtis', 'email': 'dc@gmail.com'},
                         {'associationName': 'IS', 'firstName': 'Robert', 'lastName': 'Nelson', 'email': 'rn@gmail.com'}];
  
  assert(!isAMember('Jennifer', 'Côté', members2));
  addMember('SPCA', 'Jennifer', 'Côté', 'jennifer.cote@gmail.com', members2);

  assert(isAMember('Dzenan', 'Ridjanovic', members2));
  removeMember('Dzenan', 'Ridjanovic', members2);

  assert(isAMember('David', 'Curtis', members2));
  updateMember(['SPCA'], 'David', 'Curtis' , 'David.curtis@hotmail.com' , members2);  

//8.4
print('8.4 Find the group of 1s in a matrix');
print("");
findGroups(matrix);

//8.5 https://github.com/dzenanr/sliding_puzzle_wout_ui/blob/master/sliding_puzzle.dart was giving the exact needed code.
print('8.5 Sliding Puzzle : ');
print("");
var puzzle = new Puzzle(2);
puzzle.display('Start');
puzzle.solve();
}