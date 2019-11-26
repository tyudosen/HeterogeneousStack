with Ada.Text_IO; use Ada.Text_IO;
with hetro_stack;
package body hetro_stack_elems is
package IIO is new Ada.Text_IO.Integer_IO(Integer); use IIO;


---------- Procedure(s) for Vehicle Record -------------------------------------------
    procedure AssignVehicleType(aVehicle: in out Vehicle; CarOrPlane: in Vehicles) is
    
    begin
        aVehicle.VehicleType := CarOrPlane;
    end AssignVehicleType;

    procedure AssignNumDoors(aVehicle: in out Vehicle; Num: in Integer) is 

    begin
        aVehicle.NumOfDoors := Num;
    end AssignNumDoors;

    procedure PrintNumOfDoors(aVehicle: in out Vehicle) is 
    begin
        put("Number Doors: ");
        put(aVehicle.NumOfDoors);
        new_line;
    end PrintNumOfDoors;

    procedure Print(aVehicle: in Vehicle) is
    begin
        null;
    end Print;

    function Compare(aVehicle: in Vehicle; Other: in Vehicle'Class) return Boolean is
    begin
       return False;
    end Compare;

   

---------Procedure for Car Record ------------------------------------------------------
    procedure AssignManf(aCar: in out CarRec; Manf: in CarString) is
    begin
        aCar.Manf := Manf;
    end AssignManf;

    procedure PrintCarString(PrtStr: CarString) is 
    begin
        for Index in 1..5 loop
            put(PrtStr(Index));
        end loop;
    end PrintCarString;

    procedure Print(aCar: in CarRec) is 
    begin
        put_line("-------------------------------------------------------------------------------------");
        put("Vehicle Type: "); 
        VehiclesIO.put(aCar.VehicleType);new_line;
        put("Manufacturer: ");
        PrintCarString(aCar.Manf) ;new_line;
        put("Number of Doors: ");
        put(aCar.NumOfDoors, 0);new_line;
        put_line("-------------------------------------------------------------------------------------");
    end Print;

    function Compare(aCar: in CarRec; Other: in Vehicle'Class) return Boolean is
    begin
       return Other in CarRec and then aCar.Manf = CarRec(Other).Manf;
    end Compare;

---------Procedures for Plane Record -----------------------------------------------------
    procedure AssignNumEngines(aPlane: in out PlaneRec; Num: in Integer) is 
    begin
        aPlane.NumOfEngines := Num;
    end AssignNumEngines;

    procedure AssignManf(aPlane: in out PlaneRec; Manf: in PlaneString) is 
    begin
        aPlane.Manf := Manf;
    end AssignManf;

    procedure PrintPlaneString(PrtStr: PlaneString) is 
    begin
        for Index in 1..8 loop
            put(PrtStr(Index));
        end loop;
    end PrintPlaneString;

    procedure Print(aPlane: in PlaneRec) is 
    begin
        put_line("-------------------------------------------------------------------------------------");
        put("Vehicle Type: "); 
        VehiclesIO.put(aPlane.VehicleType);new_line;
        put("Manufacturer: "); 
        PrintPlaneString(aPlane.Manf);new_line;
        put("Number of Doors: "); 
        put(aPlane.NumOfDoors, 0);new_line;
        put("Number of Engines: "); 
        put(aPlane.NumOfEngines, 0);new_line;
        put_line("-------------------------------------------------------------------------------------");
    end Print;

    function Compare(aPlane: in PlaneRec; Other: in Vehicle'Class) return Boolean is
    begin
       return Other in PlaneRec and then aPlane.Manf = PlaneRec(Other).Manf;
    end Compare;

end hetro_stack_elems;