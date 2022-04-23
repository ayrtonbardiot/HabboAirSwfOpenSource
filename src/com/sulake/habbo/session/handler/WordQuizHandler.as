// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.handler.WordQuizHandler

package com.sulake.habbo.session.handler
{
    import _-ja._SafeStr_271;
    import _-ja._SafeStr_679;
    import _-ja._SafeStr_481;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.IRoomSession;
    import _-QB._SafeStr_1433;
    import com.sulake.habbo.session.events.RoomSessionWordQuizEvent;
    import _-QB._SafeStr_1280;
    import _-QB._SafeStr_1194;

    public class WordQuizHandler extends BaseHandler 
    {

        public function WordQuizHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (!_arg_1)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_271(onQuestionStatus));
            _arg_1.addMessageEvent(new _SafeStr_679(onQuestionAnsweredEvent));
            _arg_1.addMessageEvent(new _SafeStr_481(onQuestionFinishedEvent));
        }

        private function onQuestionStatus(_arg_1:_SafeStr_271):void
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
            var _local_2:_SafeStr_1433 = _arg_1.getParser();
            _local_4 = new RoomSessionWordQuizEvent("RWPUW_NEW_QUESTION", _local_3, _local_2.pollId);
            _local_4.question = _local_2.question;
            _local_4.duration = _local_2.duration;
            _local_4.pollType = _local_2.pollType;
            _local_4.questionId = _local_2.questionId;
            _local_4.pollId = _local_2.pollId;
            listener.events.dispatchEvent(_local_4);
        }

        private function onQuestionAnsweredEvent(_arg_1:_SafeStr_679):void
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
            var _local_2:_SafeStr_1280 = _arg_1.getParser();
            _local_4 = new RoomSessionWordQuizEvent("RWPUW_QUESTION_ANSWERED", _local_3, _local_2.userId);
            _local_4.value = _local_2.value;
            _local_4.userId = _local_2.userId;
            _local_4.answerCounts = _local_2.answerCounts;
            listener.events.dispatchEvent(_local_4);
        }

        private function onQuestionFinishedEvent(_arg_1:_SafeStr_481):void
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
            var _local_2:_SafeStr_1194 = _arg_1.getParser();
            _local_4 = new RoomSessionWordQuizEvent("RWPUW_QUESION_FINSIHED", _local_3);
            _local_4.questionId = _local_2.questionId;
            _local_4.answerCounts = _local_2.answerCounts;
            listener.events.dispatchEvent(_local_4);
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1194 = "_-pr" (String#32272, DoABC#4)
// _SafeStr_1280 = "_-W1h" (String#36612, DoABC#4)
// _SafeStr_1433 = "_-e13" (String#37530, DoABC#4)
// _SafeStr_271 = "_-wI" (String#22963, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_481 = "_-41k" (String#24406, DoABC#4)
// _SafeStr_679 = "_-O1t" (String#28151, DoABC#4)


