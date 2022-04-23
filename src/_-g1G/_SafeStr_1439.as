// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1439

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1611;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1439 implements IMessageParser 
    {

        private var _SafeStr_4838:String;
        private var _SafeStr_3814:Array;


        public function flush():Boolean
        {
            _SafeStr_3814 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_3814 = [];
            _SafeStr_4838 = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_3814.push(new _SafeStr_1611(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get products():Array
        {
            return (_SafeStr_3814);
        }


    }
}//package _-g1G

// _SafeStr_1439 = "_-01w" (String#6497, DoABC#3)
// _SafeStr_1611 = "_-m6" (String#9821, DoABC#3)
// _SafeStr_3814 = "_-H1d" (String#7672, DoABC#3)
// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)


