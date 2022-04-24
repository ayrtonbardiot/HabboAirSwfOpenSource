// by nota

//_-QB._SafeStr_1124

package _-QB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1124 implements IMessageParser 
    {

        private var _SafeStr_3820:int = -1;
        private var _startMessage:String = "";
        private var _endMessage:String = "";
        private var _SafeStr_4713:int = 0;
        private var _questionArray:Array = null;
        private var _SafeStr_4714:Boolean = false;


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get startMessage():String
        {
            return (_startMessage);
        }

        public function get endMessage():String
        {
            return (_endMessage);
        }

        public function get numQuestions():int
        {
            return (_SafeStr_4713);
        }

        public function get questionArray():Array
        {
            return (_questionArray);
        }

        public function get npsPoll():Boolean
        {
            return (_SafeStr_4714);
        }

        public function flush():Boolean
        {
            _SafeStr_3820 = -1;
            _startMessage = "";
            _endMessage = "";
            _SafeStr_4713 = 0;
            _questionArray = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_4:* = null;
            var _local_5:int;
            var _local_3:int;
            _SafeStr_3820 = _arg_1.readInteger();
            _startMessage = _arg_1.readString();
            _endMessage = _arg_1.readString();
            _SafeStr_4713 = _arg_1.readInteger();
            _questionArray = [];
            _local_2 = 0;
            while (_local_2 < _SafeStr_4713)
            {
                _local_4 = parseQuestion(_arg_1);
                _local_5 = _arg_1.readInteger();
                _local_3 = 0;
                while (_local_3 < _local_5)
                {
                    _local_4.children.push(parseQuestion(_arg_1));
                    _local_3++;
                };
                _questionArray.push(_local_4);
                _local_2++;
            };
            _SafeStr_4714 = _arg_1.readBoolean();
            return (true);
        }

        private function parseQuestion(_arg_1:IMessageDataWrapper):_SafeStr_1558
        {
            var _local_2:int;
            var _local_3:_SafeStr_1558 = new _SafeStr_1558();
            _local_3.questionId = _arg_1.readInteger();
            _local_3.sortOrder = _arg_1.readInteger();
            _local_3.questionType = _arg_1.readInteger();
            _local_3.questionText = _arg_1.readString();
            _local_3.questionCategory = _arg_1.readInteger();
            _local_3.questionAnswerType = _arg_1.readInteger();
            _local_3.questionAnswerCount = _arg_1.readInteger();
            if (((_local_3.questionType == 1) || (_local_3.questionType == 2)))
            {
                _local_2 = 0;
                while (_local_2 < _local_3.questionAnswerCount)
                {
                    _local_3.questionChoices.push(new _SafeStr_1580(_arg_1.readString(), _arg_1.readString(), _arg_1.readInteger()));
                    _local_2++;
                };
            };
            return (_local_3);
        }


    }
}//package _-QB

// _SafeStr_1124 = "_-114" (String#6533, DoABC#3)
// _SafeStr_1558 = "_-c14" (String#9104, DoABC#3)
// _SafeStr_1580 = "_-71q" (String#7030, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4713 = "_-jI" (String#9621, DoABC#3)
// _SafeStr_4714 = "_-l1g" (String#9752, DoABC#3)


