// by nota

//com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectMoveUpdateMessage extends RoomObjectUpdateMessage 
    {

        private var _SafeStr_4073:IVector3d;
        private var _isSlideUpdate:Boolean;

        public function RoomObjectMoveUpdateMessage(_arg_1:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3);
            _isSlideUpdate = _arg_4;
            _SafeStr_4073 = _arg_2;
        }

        public function get targetLoc():IVector3d
        {
            if (_SafeStr_4073 == null)
            {
                return (loc);
            };
            return (_SafeStr_4073);
        }

        public function get realTargetLoc():IVector3d
        {
            return (_SafeStr_4073);
        }

        public function get isSlideUpdate():Boolean
        {
            return (_isSlideUpdate);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4073 = "_-gU" (String#2051, DoABC#4)


