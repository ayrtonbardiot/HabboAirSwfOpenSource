// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wm._SafeStr_1205

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-JS._SafeStr_1604;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1205 implements IMessageParser 
    {

        private var _SafeStr_4782:Array;
        private var _others:Array;


        public function flush():Boolean
        {
            this._SafeStr_4782 = [];
            this._others = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._SafeStr_4782.push(new _SafeStr_1604(_arg_1));
                _local_3++;
            };
            var _local_4:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                this._others.push(new _SafeStr_1604(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get friends():Array
        {
            return (this._SafeStr_4782);
        }

        public function get others():Array
        {
            return (this._others);
        }


    }
}//package _-wm

// _SafeStr_1205 = "_-vj" (String#10423, DoABC#3)
// _SafeStr_1604 = "_-S10" (String#8392, DoABC#3)
// _SafeStr_4782 = "_-N1y" (String#8082, DoABC#3)


