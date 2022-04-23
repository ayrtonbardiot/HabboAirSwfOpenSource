// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.events.RoomObjectMouseEvent

package com.sulake.room.events
{
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectMouseEvent extends RoomObjectEvent 
    {

        public static const ROOM_OBJECT_MOUSE_CLICK:String = "ROE_MOUSE_CLICK";
        public static const ROOM_OBJECT_MOUSE_ENTER:String = "ROE_MOUSE_ENTER";
        public static const ROOM_OBJECT_MOUSE_MOVE:String = "ROE_MOUSE_MOVE";
        public static const ROOM_OBJECT_MOUSE_LEAVE:String = "ROE_MOUSE_LEAVE";
        public static const ROOM_OBJECT_MOUSE_DOUBLE_CLICK:String = "ROE_MOUSE_DOUBLE_CLICK";
        public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";

        private var _SafeStr_4526:String = "";
        private var _altKey:Boolean;
        private var _ctrlKey:Boolean;
        private var _shiftKey:Boolean;
        private var _SafeStr_4527:Boolean;
        private var _SafeStr_4528:int;
        private var _SafeStr_4529:int;
        private var _SafeStr_4530:int;
        private var _SafeStr_4531:int;

        public function RoomObjectMouseEvent(_arg_1:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Boolean=false, _arg_9:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_8, _arg_9);
            _SafeStr_4526 = _arg_3;
            _altKey = _arg_4;
            _ctrlKey = _arg_5;
            _shiftKey = _arg_6;
            _SafeStr_4527 = _arg_7;
        }

        public function get eventId():String
        {
            return (_SafeStr_4526);
        }

        public function get altKey():Boolean
        {
            return (_altKey);
        }

        public function get ctrlKey():Boolean
        {
            return (_ctrlKey);
        }

        public function get shiftKey():Boolean
        {
            return (_shiftKey);
        }

        public function get buttonDown():Boolean
        {
            return (_SafeStr_4527);
        }

        public function get localX():int
        {
            return (_SafeStr_4528);
        }

        public function get localY():int
        {
            return (_SafeStr_4529);
        }

        public function get spriteOffsetX():int
        {
            return (_SafeStr_4530);
        }

        public function get spriteOffsetY():int
        {
            return (_SafeStr_4531);
        }

        public function set localX(_arg_1:int):void
        {
            _SafeStr_4528 = _arg_1;
        }

        public function set localY(_arg_1:int):void
        {
            _SafeStr_4529 = _arg_1;
        }

        public function set spriteOffsetX(_arg_1:int):void
        {
            _SafeStr_4530 = _arg_1;
        }

        public function set spriteOffsetY(_arg_1:int):void
        {
            _SafeStr_4531 = _arg_1;
        }


    }
}//package com.sulake.room.events

// _SafeStr_4526 = "_-R1b" (String#5601, DoABC#4)
// _SafeStr_4527 = "_-53" (String#8853, DoABC#4)
// _SafeStr_4528 = "_-Cd" (String#9304, DoABC#4)
// _SafeStr_4529 = "_-gd" (String#9296, DoABC#4)
// _SafeStr_4530 = "_-D13" (String#10150, DoABC#4)
// _SafeStr_4531 = "_-71r" (String#9888, DoABC#4)


