// by nota

//_-wm._SafeStr_1260

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-JS._SafeStr_1566;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1260 implements IMessageParser 
    {

        private var _SafeStr_7744:Array;


        public function flush():Boolean
        {
            this._SafeStr_7744 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._SafeStr_7744.push(new _SafeStr_1566(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get failures():Array
        {
            return (this._SafeStr_7744);
        }


    }
}//package _-wm

// _SafeStr_1260 = "_-ji" (String#9648, DoABC#3)
// _SafeStr_1566 = "_-O1O" (String#8142, DoABC#3)
// _SafeStr_7744 = "_-O1h" (String#8157, DoABC#3)


