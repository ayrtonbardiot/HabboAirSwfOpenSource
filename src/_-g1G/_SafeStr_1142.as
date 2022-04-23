// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1142

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1142 implements IMessageParser 
    {

        private var _productName:String = "";
        private var _productDescription:String = "";


        public function flush():Boolean
        {
            _productDescription = "";
            _productName = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _productDescription = _arg_1.readString();
            _productName = _arg_1.readString();
            return (true);
        }

        public function get productName():String
        {
            return (_productName);
        }

        public function get productDescription():String
        {
            return (_productDescription);
        }


    }
}//package _-g1G

// _SafeStr_1142 = "_-F1x" (String#7558, DoABC#3)


