// by nota

//com.sulake.habbo.room.messages.RoomObjectRoomAdUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.display.BitmapData;

    public class RoomObjectRoomAdUpdateMessage extends RoomObjectUpdateMessage 
    {

        public static const ROOM_AD_ACTIVATE:String = "RORUM_ROOM_AD_ACTIVATE";
        public static const ROOM_BILLBOARD_IMAGE_LOADED:String = "RORUM_ROOM_BILLBOARD_IMAGE_LOADED";
        public static const ROOM_BILLBOARD_LOADING_FAILED:String = "RORUM_ROOM_BILLBOARD_IMAGE_LOADING_FAILED";

        private var _SafeStr_4028:String;
        private var _asset:String;
        private var _SafeStr_4177:String;
        private var _SafeStr_4157:int;
        private var _bitmapData:BitmapData;

        public function RoomObjectRoomAdUpdateMessage(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:int=-1, _arg_5:BitmapData=null)
        {
            super(null, null);
            _SafeStr_4028 = _arg_1;
            _asset = _arg_2;
            _SafeStr_4177 = _arg_3;
            _SafeStr_4157 = _arg_4;
            _bitmapData = _arg_5;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get asset():String
        {
            return (_asset);
        }

        public function get clickUrl():String
        {
            return (_SafeStr_4177);
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get bitmapData():BitmapData
        {
            return (_bitmapData);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4177 = "_-G1Y" (String#3681, DoABC#4)


