// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.handler.PollHandler

package com.sulake.habbo.session.handler
{
    import _-ja._SafeStr_217;
    import _-ja._SafeStr_864;
    import _-ja._SafeStr_443;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.IRoomSession;
    import _-QB._SafeStr_1411;
    import com.sulake.habbo.session.events.RoomSessionPollEvent;
    import _-QB._SafeStr_1192;
    import _-QB._SafeStr_1124;

    public class PollHandler extends BaseHandler 
    {

        public function PollHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (!_arg_1)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_217(onPollContentsEvent));
            _arg_1.addMessageEvent(new _SafeStr_864(onPollOfferEvent));
            _arg_1.addMessageEvent(new _SafeStr_443(onPollErrorEvent));
        }

        private function onPollOfferEvent(_arg_1:_SafeStr_864):void
        {
            var _local_4:* = null;
            if (!_arg_1)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1411 = _arg_1.getParser();
            _local_4 = new RoomSessionPollEvent("RSPE_POLL_OFFER", _local_3, _local_2.id);
            _local_4.summary = _local_2.headline;
            _local_4.summary = _local_2.summary;
            listener.events.dispatchEvent(_local_4);
        }

        private function onPollErrorEvent(_arg_1:_SafeStr_443):void
        {
            var _local_4:* = null;
            if (!_arg_1)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1192 = _arg_1.getParser();
            _local_4 = new RoomSessionPollEvent("RSPE_POLL_ERROR", _local_3, -1);
            _local_4.headline = "???";
            _local_4.summary = "???";
            listener.events.dispatchEvent(_local_4);
        }

        private function onPollContentsEvent(_arg_1:_SafeStr_217):void
        {
            var _local_4:* = null;
            if (!_arg_1)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1124 = _arg_1.getParser();
            _local_4 = new RoomSessionPollEvent("RSPE_POLL_CONTENT", _local_3, _local_2.id);
            _local_4.startMessage = _local_2.startMessage;
            _local_4.endMessage = _local_2.endMessage;
            _local_4.numQuestions = _local_2.numQuestions;
            _local_4.questionArray = _local_2.questionArray;
            _local_4.npsPoll = _local_2.npsPoll;
            listener.events.dispatchEvent(_local_4);
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1124 = "_-114" (String#34741, DoABC#4)
// _SafeStr_1192 = "_-a1l" (String#37437, DoABC#4)
// _SafeStr_1411 = "_-v1k" (String#34159, DoABC#4)
// _SafeStr_217 = "_-P13" (String#26381, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_443 = "_-51H" (String#23503, DoABC#4)
// _SafeStr_864 = "_-j1" (String#24219, DoABC#4)


