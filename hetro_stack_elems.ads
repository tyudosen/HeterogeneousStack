with hetro_stack;
with Ada.Text_IO; use Ada.Text_IO;
package hetro_stack_elems is
    
    type CarString is new String(1..5); -- Holds Car Type.
    type PlaneString is new String(1..8); -- Holds Plane Type.
    
    type Vehicles is (Car, Plane);
    package VehiclesIO is new Ada.Text_IO.Enumeration_IO(Vehicles);

    -- Description: Parent Record. Cars and Plane records are derived from this, with relevant
    -- .. fields added on.
    type Vehicle is tagged record
        VehicleType: Vehicles;
        NumOfDoors: Integer;
    end record;

    ----- Procedure(s) For type Vehicle.
    procedure AssignVehicleType(aVehicle: in out Vehicle; CarOrPlane: in Vehicles);
    procedure AssignNumDoors(aVehicle: in out Vehicle; Num: in Integer);
    procedure PrintNumOfDoors(aVehicle: in out Vehicle);
    procedure Print(aVehicle: in Vehicle);
    function Compare(aVehicle: in Vehicle; Other: in Vehicle'Class) return Boolean;
   

    -- Child. Inherits componenents from Vehicle record.
    type CarRec is new Vehicle with record
        Manf : CarString;
    end record;
    type CarRecPtr is access CarRec;

    --- Procedure(s) for type CarRec.
    procedure AssignManf(aCar: in out CarRec; Manf: in CarString);
    procedure PrintCarString(PrtStr: CarString);
    procedure Print(aCar: in CarRec);
    function Compare(aCar: in CarRec; Other: in Vehicle'Class) return Boolean;

    -- Child. Inheriets from Vehicle record.
    type PlaneRec is new Vehicle with record
        Manf : PlaneString;
        NumOfEngines: Integer;
    end record;
    type PlaneRecPtr is access PlaneRec;

    -- Procedure(s) for PlaneRec.
    procedure AssignNumEngines(aPlane: in out PlaneRec; Num: in Integer);
    procedure AssignManf(aPlane: in out PlaneRec; Manf: in PlaneString);
    procedure PrintPlaneString(PrtStr: PlaneString);
    procedure Print(aPlane: in PlaneRec);
    function Compare(aPlane: in PlaneRec; Other: in Vehicle'Class) return Boolean;

end hetro_stack_elems;