// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.events.RoomObjectWallMouseEvent

package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectWallMouseEvent extends RoomObjectMouseEvent 
    {

        private var _SafeStr_4050:Number;
        private var _SafeStr_4051:Number;
        private var _direction:Number;
        private var _SafeStr_6472:Vector3d = null;
        private var _SafeStr_6473:Vector3d = null;
        private var _SafeStr_6474:Vector3d = null;

        public function RoomObjectWallMouseEvent(_arg_1:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:IVector3d, _arg_7:Number, _arg_8:Number, _arg_9:Number, _arg_10:Boolean=false, _arg_11:Boolean=false, _arg_12:Boolean=false, _arg_13:Boolean=false, _arg_14:Boolean=false, _arg_15:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_10, _arg_11, _arg_12, _arg_13, _arg_14, _arg_15);
            _SafeStr_6472 = new Vector3d();
            _SafeStr_6472.assign(_arg_4);
            _SafeStr_6473 = new Vector3d();
            _SafeStr_6473.assign(_arg_5);
            _SafeStr_6474 = new Vector3d();
            _SafeStr_6474.assign(_arg_6);
            _SafeStr_4050 = _arg_7;
            _SafeStr_4051 = _arg_8;
            _direction = _arg_9;
        }

        public function get wallLocation():IVector3d
        {
            return (_SafeStr_6472);
        }

        public function get wallWidth():IVector3d
        {
            return (_SafeStr_6473);
        }

        public function get wallHeight():IVector3d
        {
            return (_SafeStr_6474);
        }

        public function get x():Number
        {
            return (_SafeStr_4050);
        }

        public function get y():Number
        {
            return (_SafeStr_4051);
        }

        public function get direction():Number
        {
            return (_direction);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_6472 = "_-g1R" (String#14209, DoABC#4)
// _SafeStr_6473 = "_-T11" (String#14554, DoABC#4)
// _SafeStr_6474 = "_-tF" (String#14217, DoABC#4)


