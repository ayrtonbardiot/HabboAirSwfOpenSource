// by nota

//com.sulake.habbo.freeflowchat.history.visualization.entry.ChatHistoryEntryBitmapBubble

package com.sulake.habbo.freeflowchat.history.visualization.entry
{
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.text.TextField;
    import com.sulake.habbo.freeflowchat.history.visualization.enum._SafeStr_3338;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import com.sulake.habbo.freeflowchat.data.ChatItem;

    public class ChatHistoryEntryBitmapBubble implements _SafeStr_3280 
    {

        private var _bitmap:BitmapData;
        private var _overlap:Rectangle;
        private var _SafeStr_4128:int;
        private var _SafeStr_3693:int;
        private var _SafeStr_5543:Boolean;
        private var _userName:String;

        public function ChatHistoryEntryBitmapBubble(_arg_1:ChatItem, _arg_2:Boolean, _arg_3:String, _arg_4:BitmapData, _arg_5:Rectangle=null)
        {
            _overlap = _arg_5;
            _SafeStr_4128 = _arg_1.userId;
            _SafeStr_3693 = _arg_1.roomId;
            var _local_6:TextField = new TextField();
            _local_6.defaultTextFormat = _SafeStr_3338.TEXT_FORMAT_TIMESTAMP;
            _local_6.text = HabboFreeFlowChat.getTimeStampNow();
            _local_6.thickness = -15;
            _local_6.sharpness = 80;
            _local_6.antiAliasType = "advanced";
            _local_6.embedFonts = true;
            _local_6.gridFitType = "pixel";
            var _local_8:int = _arg_4.height;
            var _local_7:int = 62;
            var _local_9:int = Math.max(3, (3 + _arg_5.top));
            _bitmap = new BitmapData((_local_7 + _arg_4.width), _local_8, true, 0);
            _bitmap.draw(_local_6, new Matrix(1, 0, 0, 1, 0, _local_9));
            _bitmap.copyPixels(_arg_4, _arg_4.rect, new Point(_local_7, 0));
            _SafeStr_5543 = _arg_2;
            _userName = _arg_3;
        }

        public function get bitmap():BitmapData
        {
            return (_bitmap);
        }

        public function get overlap():Rectangle
        {
            return (_overlap);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get canIgnore():Boolean
        {
            return (_SafeStr_5543);
        }

        public function get userName():String
        {
            return (_userName);
        }


    }
}//package com.sulake.habbo.freeflowchat.history.visualization.entry

// _SafeStr_3280 = "_-mJ" (String#4458, DoABC#4)
// _SafeStr_3338 = "_-I2" (String#12834, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_5543 = "_-fu" (String#9112, DoABC#4)


