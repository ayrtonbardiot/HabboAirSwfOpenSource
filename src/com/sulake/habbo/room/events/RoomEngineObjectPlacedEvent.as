// by nota

//com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent

package com.sulake.habbo.room.events
{
    public class RoomEngineObjectPlacedEvent extends RoomEngineObjectEvent 
    {

        private var _wallLocation:String = "";
        private var _SafeStr_4050:Number = 0;
        private var _SafeStr_4051:Number = 0;
        private var _SafeStr_4052:Number = 0;
        private var _direction:int = 0;
        private var _placedInRoom:Boolean = false;
        private var _placedOnFloor:Boolean = false;
        private var _placedOnWall:Boolean = false;
        private var _SafeStr_4524:String = null;

        public function RoomEngineObjectPlacedEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Number, _arg_7:Number, _arg_8:Number, _arg_9:int, _arg_10:Boolean, _arg_11:Boolean, _arg_12:Boolean, _arg_13:String, _arg_14:Boolean=false, _arg_15:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_14, _arg_15);
            _wallLocation = _arg_5;
            _SafeStr_4050 = _arg_6;
            _SafeStr_4051 = _arg_7;
            _SafeStr_4052 = _arg_8;
            _direction = _arg_9;
            _placedInRoom = _arg_10;
            _placedOnFloor = _arg_11;
            _placedOnWall = _arg_12;
            _SafeStr_4524 = _arg_13;
        }

        public function get wallLocation():String
        {
            return (_wallLocation);
        }

        public function get x():Number
        {
            return (_SafeStr_4050);
        }

        public function get y():Number
        {
            return (_SafeStr_4051);
        }

        public function get z():Number
        {
            return (_SafeStr_4052);
        }

        public function get direction():int
        {
            return (_direction);
        }

        public function get placedInRoom():Boolean
        {
            return (_placedInRoom);
        }

        public function get placedOnFloor():Boolean
        {
            return (_placedOnFloor);
        }

        public function get placedOnWall():Boolean
        {
            return (_placedOnWall);
        }

        public function get instanceData():String
        {
            return (_SafeStr_4524);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_4052 = "_-Rt" (String#1279, DoABC#4)
// _SafeStr_4524 = "_-M1P" (String#8796, DoABC#4)


