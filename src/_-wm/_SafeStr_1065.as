// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wm._SafeStr_1065

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-JS._SafeStr_1649;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1065 implements IMessageParser 
    {

        private var _SafeStr_7735:int;
        private var _SafeStr_7736:Array;


        public function flush():Boolean
        {
            this._SafeStr_7736 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            this._SafeStr_7735 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _SafeStr_14.log(((("Received friend requests: " + _SafeStr_7735) + ", ") + _local_2));
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._SafeStr_7736.push(new _SafeStr_1649(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get totalReqCount():int
        {
            return (this._SafeStr_7735);
        }

        public function get reqs():Array
        {
            return (this._SafeStr_7736);
        }


    }
}//package _-wm

// _SafeStr_1065 = "_-lZ" (String#9776, DoABC#3)
// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_1649 = "_-v1E" (String#10382, DoABC#3)
// _SafeStr_7735 = "_-oq" (String#9962, DoABC#3)
// _SafeStr_7736 = "_-tM" (String#10280, DoABC#3)


