// by nota

//com.sulake.habbo.room.events.RoomToObjectOwnAvatarMoveEvent

package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomToObjectEvent;
    import com.sulake.room.utils.IVector3d;

    public class RoomToObjectOwnAvatarMoveEvent extends RoomToObjectEvent 
    {

        public static const MOVE_TO:String = "ROAME_MOVE_TO";

        private var _SafeStr_4073:IVector3d;

        public function RoomToObjectOwnAvatarMoveEvent(_arg_1:String, _arg_2:IVector3d, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            _SafeStr_4073 = _arg_2;
        }

        public function get targetLoc():IVector3d
        {
            return (_SafeStr_4073);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4073 = "_-gU" (String#2051, DoABC#4)


