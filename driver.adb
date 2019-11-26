with Ada.Text_IO; use Ada.Text_IO;
with hetro_stack; 
with hetro_stack_elems; use hetro_stack_elems;
with Ada.Calendar; use Ada.Calendar;
procedure driver is
package IIO is new Ada.Text_IO.Integer_IO(Integer); use IIO;

  -- Will Satisfy Formal Parameter for generic instatntiation.
  -- Vehicle'Class will allow this to be extended to all the derivatives of Vehicle.
  procedure CPrint(Pt: Vehicle'Class) is 
    begin
    Print(Pt); -- Calling Overloaded Prints in hetro_stack_elem (dVehicle's Print and it's derivatices)
  end CPrint;

  function Comp(Obj1,Obj2 : in Vehicle'Class) return Boolean is
  begin
    return Compare(Obj1,Obj2);
  end Comp;
  
  package SS is new hetro_Stack(Vehicle,Comp); use SS;
  procedure PrintAllList is new PrintList(CPrint);

  VehicleStack, PlaneStack : hetroStack;
  Size: Integer := 0;
  CarObj: CarRecPtr;
  PlaneObj: PlaneRecPtr;
  CarRef: aliased CarRec;
  VPoint : access Vehicle'Class;
begin  
  SetHeadNode(VehicleStack); -- Creates List Head (Car).
  SetHeadNode(PlaneStack); -- Creates List Head (Plane).
  
  -- (a) 4 Door Ford, Insert Rear
  CarObj := new CarRec'(VehicleType => Car, NumOfDoors => 4, Manf => "FORD ") ;
  PushRear(VehicleStack, ItemPt(CarObj));
  --Print(CarObj.all);

  -- (b) 2 Door Ford, Insert Front
  CarObj := new CarRec'(VehicleType => Car, NumOfDoors => 2, Manf => "FORD ") ;
  PushFront(VehicleStack, ItemPt(CarObj));
  --Print(CarObj.all);

  -- (c) 2 Door GMC, Insert Rear.
  CarObj := new CarRec'(VehicleType => Car, NumOfDoors => 2, Manf => "GMC  ") ;
  PushRear(VehicleStack, ItemPt(CarObj));
  --Print(CarObj.all);

  -- (d) 2 Door Ram, Insert Rear.
  CarObj := new CarRec'(VehicleType => Car, NumOfDoors => 2, Manf => "RAM  ") ;
  PushRear(VehicleStack, ItemPt(CarObj));
  --Print(CarObj.all);

  --(e) 3 Door Chevy, Insert Front.
  CarObj := new CarRec'(VehicleType => Car, NumOfDoors => 3, Manf => "CHEVY") ;
  PushFront(VehicleStack, ItemPt(CarObj));
  --Print(CarObj.all);
  
  --(f) Car List Size
  Size := StackSize(VehicleStack);
  put_line("Car List Size: ");
  put(Size,0);new_line;
  put_line("-----------------------------------------------------------------------------------");

  --(g) Contents of Car List
  put_line("Car List: ");
  --put_line("-----------------------------------------------------------------------------------");
  PrintAllList(VehicleStack);
 

  --(h) Find First Ford and Delete
  CarRef := CarRec'(VehicleType => Car, NumOfDoors => 0, Manf => "FORD ");
  VPoint := RemoveSpecificNode(VehicleStack, CarRef'Access);
  --put_line("Been Removed");
  --Print(VPoint.all);

  --(I) Car List Size
  Size := StackSize(VehicleStack);
  put_line("Car List Size: ");
  put(Size,0);new_line;
  put_line("-----------------------------------------------------------------------------------");
  
  --(J) Conttents of Car List
 put_line("Car List: ");
  --put_line("-----------------------------------------------------------------------------------");
  PrintAllList(VehicleStack);


  --(K) Boeing, 3 Doors, 6 Engines, Insert Front
  PlaneObj := new PlaneRec'(VehicleType => Plane, NumOfDoors => 3, Manf => "BOEING  ", NumOfEngines => 6) ;
  PushFront(PlaneStack, ItemPt(PlaneObj));


  --(L) Piper, 2 Doors, 1 Engine, Insert Front.
   PlaneObj := new PlaneRec'(VehicleType => Plane, NumOfDoors => 2, Manf => "PIPER   ", NumOfEngines => 1) ;
  PushFront(PlaneStack, ItemPt(PlaneObj));


  --(M) Cessna, 4 Doors, 4 Engines, Insert Front
  PlaneObj := new PlaneRec'(VehicleType => Plane, NumOfDoors => 4, Manf => "CESSNA  ", NumOfEngines => 4) ;
  PushFront(PlaneStack, ItemPt(PlaneObj));
  

  -- Size of Plane List
  Size := StackSize(PlaneStack);
  put_line("Plane List Size: ");
  put(Size,0);new_line;
  put_line("-----------------------------------------------------------------------------------");
  


  --(N) Contents of Plane List
  put_line("Plane List: ");
  PrintAllList(PlaneStack);
end driver;