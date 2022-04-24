// by nota

//_-QB._SafeStr_1433

package _-QB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1433 implements IMessageParser 
    {

        private var _SafeStr_4612:String = null;
        private var _SafeStr_4400:int = -1;
        private var _SafeStr_4613:int = -1;
        private var _duration:int = -1;
        private var _question:Dictionary = null;


        public function get pollType():String
        {
            return (_SafeStr_4612);
        }

        public function get pollId():int
        {
            return (_SafeStr_4400);
        }

        public function get questionId():int
        {
            return (_SafeStr_4613);
        }

        public function get duration():int
        {
            return (_duration);
        }

        public function get question():Dictionary
        {
            return (_question);
        }

        public function flush():Boolean
        {
            _SafeStr_4612 = null;
            _SafeStr_4400 = -1;
            _SafeStr_4613 = -1;
            _duration = -1;
            _question = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            _SafeStr_4612 = _arg_1.readString();
            _SafeStr_4400 = _arg_1.readInteger();
            _SafeStr_4613 = _arg_1.readInteger();
            _duration = _arg_1.readInteger();
            _question = new Dictionary();
            _question["id"] = _arg_1.readInteger();
            _question["number"] = _arg_1.readInteger();
            _question["type"] = _arg_1.readInteger();
            _question["content"] = _arg_1.readString();
            if (((_question["type"] == 1) || (_question["type"] == 2)))
            {
                _question["selection_min"] = _arg_1.readInteger();
                _local_2 = _arg_1.readInteger();
                var _local_4:Array = [];
                var _local_5:Array = [];
                _question["selections"] = _local_4;
                _question["selection_values"] = _local_5;
                _question["selection_count"] = _local_2;
                _question["selection_max"] = _local_2;
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_5.push(_arg_1.readString());
                    _local_4.push(_arg_1.readString());
                    _local_3++;
                };
            };
            return (true);
        }


    }
}//package _-QB

// _SafeStr_1433 = "_-e13" (String#9264, DoABC#3)
// _SafeStr_4400 = "_-w7" (String#10473, DoABC#3)
// _SafeStr_4612 = "_-HU" (String#7700, DoABC#3)
// _SafeStr_4613 = "_-SG" (String#8440, DoABC#3)


