// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wm._SafeStr_1496

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-JS._SafeStr_1545;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1496 implements IMessageParser 
    {

        private var _SafeStr_7747:int;
        private var _SafeStr_7748:int;
        private var _SafeStr_7749:int;
        private var _SafeStr_3921:Array;


        public function flush():Boolean
        {
            this._SafeStr_3921 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            this._SafeStr_7747 = _arg_1.readInteger();
            this._SafeStr_7748 = _arg_1.readInteger();
            this._SafeStr_7749 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._SafeStr_3921.push(new _SafeStr_1545(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get userFriendLimit():int
        {
            return (this._SafeStr_7747);
        }

        public function get normalFriendLimit():int
        {
            return (this._SafeStr_7748);
        }

        public function get extendedFriendLimit():int
        {
            return (this._SafeStr_7749);
        }

        public function get categories():Array
        {
            return (this._SafeStr_3921);
        }


    }
}//package _-wm

// _SafeStr_1496 = "_-nd" (String#9910, DoABC#3)
// _SafeStr_1545 = "_-h1b" (String#9474, DoABC#3)
// _SafeStr_3921 = "_-UY" (String#8584, DoABC#3)
// _SafeStr_7747 = "_-HS" (String#7698, DoABC#3)
// _SafeStr_7748 = "_-W1j" (String#8720, DoABC#3)
// _SafeStr_7749 = "_-K1n" (String#7896, DoABC#3)


