with Ada.Text_IO, Ada.Unchecked_Deallocation;
use Ada.Text_IO;

package body hetro_stack is

  procedure Free is new Ada.Unchecked_Deallocation(hetroStackElem, hetroStackElemPtr);


  procedure PushFront(Stack: in out hetroStack; Data: ItemPt) is
    Pt : hetroStackElemPtr := new hetroStackElem;
  begin
    Pt.Data := Data;
    Pt.RightPtr := Stack.Top.RightPtr;
    Pt.LeftPtr := Stack.Top;
    Pt.RightPtr.LeftPtr := Pt;
    Pt.LeftPtr.RightPtr := Pt;
    Stack.Count := Stack.Count + 1;
  end PushFront;


  procedure SetHeadNode(Stack: in out hetroStack) is 
    HeadNode : hetroStackElemPtr := new hetroStackElem;
  begin
    HeadNode.RightPtr := HeadNode;
    HeadNode.LeftPtr := HeadNode;
    Stack.Top := HeadNode;
  end SetHeadNode;

 
  procedure PushRear(Stack: in out hetroStack; Data: ItemPt ) is 
    Pt: hetroStackElemPtr := new hetroStackElem;
  begin
    Pt.Data := Data;
    Pt.LeftPtr := Stack.Top.LeftPtr;
    Pt.RightPtr := Stack.Top;
    Pt.LeftPtr.RightPtr := Pt;
    Pt.RightPtr.LeftPtr := Pt;
    Stack.Count := Stack.Count + 1;
  end PushRear;


  function StackSize(Stack: hetroStack) return integer is
  begin
    return Stack.Count;
  end StackSize; 


  procedure PrintList(List: in hetroStack) is 
    Pt : hetroStackElemPtr;
  begin
    Pt := List.Top.RightPtr;
    while Pt /= List.Top loop
      PrintData(Pt.Data.all);
      Pt := Pt.RightPtr;
    end loop;
  end PrintList;

  
  function RemoveSpecificNode(Stack: in out hetroStack; Data: ItemPt) return ItemPt is
    Pt: hetroStackElemPtr;
    Item : ItemPt;
  begin
    Pt := Stack.Top.RightPtr;
    while Pt /= Stack.Top loop
      if Data.all = Pt.Data.all then
        Pt.LeftPtr.RightPtr := Pt.RightPtr;
        Pt.RightPtr.LeftPtr := Pt.LeftPtr;
        Item := Pt.Data;
        Free(Pt);
        Stack.Count := Stack.Count - 1;
        return Item;
      end if;
        Pt := Pt.RightPtr;
    end loop;
    return null;
    end RemoveSpecificNode;

    
end hetro_stack;