// by nota

//_-wm._SafeStr_1420

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-JS._SafeStr_1600;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1420 implements IMessageParser 
    {

        protected var _SafeStr_7118:int;
        protected var _SafeStr_7119:int;
        private var _SafeStr_7746:Array;


        public function get totalFragments():int
        {
            return (_SafeStr_7118);
        }

        public function get fragmentNo():int
        {
            return (_SafeStr_7119);
        }

        public function get friendFragment():Array
        {
            return (_SafeStr_7746);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_7118 = _arg_1.readInteger();
            _SafeStr_7119 = _arg_1.readInteger();
            _SafeStr_7746 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._SafeStr_7746.push(new _SafeStr_1600(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_7746 = [];
            return (true);
        }


    }
}//package _-wm

// _SafeStr_1420 = "_-Yu" (String#8882, DoABC#3)
// _SafeStr_1600 = "_-Cu" (String#7407, DoABC#3)
// _SafeStr_7118 = "_-Kt" (String#7926, DoABC#3)
// _SafeStr_7119 = "_-Z1I" (String#8893, DoABC#3)
// _SafeStr_7746 = "_-af" (String#9024, DoABC#3)


