with Ada.Unchecked_Deallocation;
generic
    type Item is tagged private; -- List Data Field 
    with function "="(ObjA: Item'Class; ObjB: Item'Class) return Boolean;  
package hetro_stack is
    type hetroStack is private;
    type ItemPt is access all Item'Class;

    type hetroStackElem is private;
    type hetroStackElemPtr is access hetroStackElem;

    procedure SetHeadNode(Stack:  in out hetroStack);
    procedure PushFront(Stack: in out hetroStack; Data: ItemPt);
    procedure PushRear(Stack: in out hetroStack; Data: ItemPt);
    function StackSize(Stack: hetroStack) return Integer;
    function RemoveSpecificNode(Stack: in out hetroStack; Data: ItemPt) return ItemPt;

    generic 
        with procedure PrintData(Data: Item'Class); -- Generic Print. 
    procedure PrintList(List: in hetroStack); 
  
private
    
    
    type hetroStackElem is record
        Data: ItemPt;
        LeftPtr: hetroStackElemPtr;
        RightPtr: hetroStackElemPtr;
    end record;
    type hetroStack is record
        Count: Integer := 0;
        Top: hetroStackElemPtr := null; 
    end record;

end hetro_stack;
