// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.events.RoomSpriteMouseEvent

package com.sulake.room.events
{
    public class RoomSpriteMouseEvent 
    {

        private var _SafeStr_4028:String = "";
        private var _SafeStr_4526:String = "";
        private var _SafeStr_5520:String = "";
        private var _SafeStr_5521:String = "";
        private var _SafeStr_5522:Number = 0;
        private var _SafeStr_5523:Number = 0;
        private var _SafeStr_4528:Number = 0;
        private var _SafeStr_4529:Number = 0;
        private var _ctrlKey:Boolean = false;
        private var _altKey:Boolean = false;
        private var _shiftKey:Boolean = false;
        private var _SafeStr_4527:Boolean = false;
        private var _SafeStr_4530:int = 0;
        private var _SafeStr_4531:int = 0;

        public function RoomSpriteMouseEvent(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Number, _arg_6:Number, _arg_7:Number=0, _arg_8:Number=0, _arg_9:Boolean=false, _arg_10:Boolean=false, _arg_11:Boolean=false, _arg_12:Boolean=false)
        {
            _SafeStr_4028 = _arg_1;
            _SafeStr_4526 = _arg_2;
            _SafeStr_5520 = _arg_3;
            _SafeStr_5521 = _arg_4;
            _SafeStr_5522 = _arg_5;
            _SafeStr_5523 = _arg_6;
            _SafeStr_4528 = _arg_7;
            _SafeStr_4529 = _arg_8;
            _ctrlKey = _arg_9;
            _altKey = _arg_10;
            _shiftKey = _arg_11;
            _SafeStr_4527 = _arg_12;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get eventId():String
        {
            return (_SafeStr_4526);
        }

        public function get canvasId():String
        {
            return (_SafeStr_5520);
        }

        public function get spriteTag():String
        {
            return (_SafeStr_5521);
        }

        public function get screenX():Number
        {
            return (_SafeStr_5522);
        }

        public function get screenY():Number
        {
            return (_SafeStr_5523);
        }

        public function get localX():Number
        {
            return (_SafeStr_4528);
        }

        public function get localY():Number
        {
            return (_SafeStr_4529);
        }

        public function get ctrlKey():Boolean
        {
            return (_ctrlKey);
        }

        public function get altKey():Boolean
        {
            return (_altKey);
        }

        public function get shiftKey():Boolean
        {
            return (_shiftKey);
        }

        public function get buttonDown():Boolean
        {
            return (_SafeStr_4527);
        }

        public function get spriteOffsetX():int
        {
            return (_SafeStr_4530);
        }

        public function set spriteOffsetX(_arg_1:int):void
        {
            _SafeStr_4530 = _arg_1;
        }

        public function get spriteOffsetY():int
        {
            return (_SafeStr_4531);
        }

        public function set spriteOffsetY(_arg_1:int):void
        {
            _SafeStr_4531 = _arg_1;
        }


    }
}//package com.sulake.room.events

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4526 = "_-R1b" (String#5601, DoABC#4)
// _SafeStr_4527 = "_-53" (String#8853, DoABC#4)
// _SafeStr_4528 = "_-Cd" (String#9304, DoABC#4)
// _SafeStr_4529 = "_-gd" (String#9296, DoABC#4)
// _SafeStr_4530 = "_-D13" (String#10150, DoABC#4)
// _SafeStr_4531 = "_-71r" (String#9888, DoABC#4)
// _SafeStr_5520 = "_-C13" (String#8616, DoABC#4)
// _SafeStr_5521 = "_-31t" (String#8747, DoABC#4)
// _SafeStr_5522 = "_-E1Q" (String#19086, DoABC#4)
// _SafeStr_5523 = "_-o8" (String#17946, DoABC#4)


