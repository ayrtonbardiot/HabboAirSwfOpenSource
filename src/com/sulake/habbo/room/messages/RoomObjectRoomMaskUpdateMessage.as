// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage 
    {

        public static const ADD_MASK:String = "RORMUM_ADD_MASK";
        public static const REMOVE_MASK:String = "RORMUM_ADD_MASK";
        public static const MASK_TYPE_DOOR:String = "door";
        public static const MASK_CATEGORY_WINDOW:String = "window";
        public static const MASK_CATEGORY_HOLE:String = "hole";

        private var _SafeStr_4028:String = "";
        private var _SafeStr_4464:String = "";
        private var _SafeStr_4465:String = "";
        private var _SafeStr_4466:Vector3d = null;
        private var _SafeStr_4467:String = "window";

        public function RoomObjectRoomMaskUpdateMessage(_arg_1:String, _arg_2:String, _arg_3:String=null, _arg_4:IVector3d=null, _arg_5:String="window")
        {
            super(null, null);
            _SafeStr_4028 = _arg_1;
            _SafeStr_4464 = _arg_2;
            _SafeStr_4465 = _arg_3;
            if (_arg_4 != null)
            {
                _SafeStr_4466 = new Vector3d(_arg_4.x, _arg_4.y, _arg_4.z);
            };
            _SafeStr_4467 = _arg_5;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get maskId():String
        {
            return (_SafeStr_4464);
        }

        public function get maskType():String
        {
            return (_SafeStr_4465);
        }

        public function get maskLocation():IVector3d
        {
            return (_SafeStr_4466);
        }

        public function get maskCategory():String
        {
            return (_SafeStr_4467);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4464 = "_-11G" (String#20663, DoABC#4)
// _SafeStr_4465 = "_-C16" (String#17992, DoABC#4)
// _SafeStr_4466 = "_-Kk" (String#18781, DoABC#4)
// _SafeStr_4467 = "_-A1b" (String#18390, DoABC#4)


