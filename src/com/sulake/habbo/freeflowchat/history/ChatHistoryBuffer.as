// by nota

//com.sulake.habbo.freeflowchat.history.ChatHistoryBuffer

package com.sulake.habbo.freeflowchat.history
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.freeflowchat.history.visualization.entry._SafeStr_3280;
    import com.sulake.habbo.freeflowchat.data.ChatItem;
    import _-Ja._SafeStr_1569;

    public class ChatHistoryBuffer implements _SafeStr_13 
    {

        private const MAX_CHAT_ITEMS:int = 1000;

        private var _SafeStr_4147:HabboFreeFlowChat;
        private var _SafeStr_5093:Vector.<_SafeStr_3280> = new Vector.<_SafeStr_3280>(0);

        public function ChatHistoryBuffer(_arg_1:HabboFreeFlowChat)
        {
            _SafeStr_4147 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_5093 = null;
            _SafeStr_4147 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4147 == null);
        }

        public function insertChat(_arg_1:ChatItem):void
        {
            var _local_2:* = null;
            try
            {
                _local_2 = _SafeStr_4147.chatBubbleFactory.getHistoryLineEntry(_arg_1);
            }
            catch(e:Error)
            {
                if (e.errorID == 2015)
                {
                    return;
                };
                throw (e);
            };
            _SafeStr_5093.push(_local_2);
            checkBufferOverflowAndSpliceTop(_local_2);
            if (_SafeStr_4147.chatHistoryScrollView.isActive)
            {
                _SafeStr_4147.chatHistoryScrollView.addHistoryEntry(_SafeStr_5093[(_SafeStr_5093.length - 1)]);
            };
        }

        public function insertRoomChange(_arg_1:_SafeStr_1569):void
        {
            var _local_2:_SafeStr_3280 = _SafeStr_4147.chatBubbleFactory.getHistoryRoomChangeEntry(_arg_1);
            _SafeStr_5093.push(_local_2);
            checkBufferOverflowAndSpliceTop(_local_2);
        }

        private function checkBufferOverflowAndSpliceTop(_arg_1:_SafeStr_3280):void
        {
            if (_SafeStr_5093.length > 1000)
            {
                _SafeStr_4147.chatHistoryScrollView.scrollUpAndSpliceTopItem(((_arg_1.bitmap.height - _arg_1.overlap.y) - 8));
                _SafeStr_5093.splice(0, 1);
            };
        }

        public function get entries():Vector.<_SafeStr_3280>
        {
            return (_SafeStr_5093);
        }

        public function get totalHeight():int
        {
            var _local_2:int;
            for each (var _local_1:_SafeStr_3280 in _SafeStr_5093)
            {
                _local_2 = (_local_2 + ((_local_1.bitmap.height - _local_1.overlap.y) - 8));
            };
            return (_local_2);
        }


    }
}//package com.sulake.habbo.freeflowchat.history

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_3280 = "_-mJ" (String#4458, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_5093 = "_-Pc" (String#1317, DoABC#4)


