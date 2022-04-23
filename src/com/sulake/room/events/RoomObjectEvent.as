// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.events.RoomObjectEvent

package com.sulake.room.events
{
    import flash.events.Event;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectEvent extends Event 
    {

        private var _SafeStr_3984:IRoomObject;

        public function RoomObjectEvent(_arg_1:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            _SafeStr_3984 = _arg_2;
        }

        public function get object():IRoomObject
        {
            return (_SafeStr_3984);
        }

        public function get objectId():int
        {
            if (_SafeStr_3984 != null)
            {
                return (_SafeStr_3984.getId());
            };
            return (-1);
        }

        public function get objectType():String
        {
            if (_SafeStr_3984 != null)
            {
                return (_SafeStr_3984.getType());
            };
            return (null);
        }


    }
}//package com.sulake.room.events

// _SafeStr_3984 = "_-Ej" (String#1774, DoABC#4)


