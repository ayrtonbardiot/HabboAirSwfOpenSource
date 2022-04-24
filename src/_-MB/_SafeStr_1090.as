// by nota

//_-MB._SafeStr_1090

package _-MB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1090 implements IMessageParser 
    {

        private var _SafeStr_7058:int = -1;
        private var _name:String;
        private var _SafeStr_7393:Array;


        public function get resultCode():int
        {
            return (_SafeStr_7058);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get nameSuggestions():Array
        {
            return (_SafeStr_7393);
        }

        public function flush():Boolean
        {
            _SafeStr_7058 = -1;
            _name = "";
            _SafeStr_7393 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_7058 = _arg_1.readInteger();
            _name = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            _SafeStr_7393 = [];
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7393.push(_arg_1.readString());
                _local_3++;
            };
            return (true);
        }


    }
}//package _-MB

// _SafeStr_1090 = "_-Z1H" (String#8892, DoABC#3)
// _SafeStr_7058 = "_-t1u" (String#10267, DoABC#3)
// _SafeStr_7393 = "_-US" (String#8580, DoABC#3)


