// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1273

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1273 implements IMessageParser 
    {

        private var _SafeStr_4838:String = "";
        private var _SafeStr_4839:Array = [];


        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get sellablePalettes():Array
        {
            return (_SafeStr_4839.slice());
        }

        public function flush():Boolean
        {
            _SafeStr_4838 = "";
            _SafeStr_4839 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_4838 = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4839.push(new _SafeStr_1579(_arg_1));
                _local_3++;
            };
            return (true);
        }


    }
}//package _-g1G

// _SafeStr_1273 = "_-uq" (String#10365, DoABC#3)
// _SafeStr_1579 = "_-32n" (String#6754, DoABC#3)
// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)
// _SafeStr_4839 = "_-J1t" (String#7786, DoABC#3)


