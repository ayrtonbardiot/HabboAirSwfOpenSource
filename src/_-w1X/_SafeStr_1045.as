// by nota

//_-w1X._SafeStr_1045

package _-w1X
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1045 implements IMessageParser 
    {

        private var _SafeStr_7697:Boolean;
        private var _productName:String;
        private var _SafeStr_7698:String;
        private var _SafeStr_7137:String;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7697 = _arg_1.readBoolean();
            _productName = _arg_1.readString();
            _SafeStr_7698 = _arg_1.readString();
            _SafeStr_7137 = _arg_1.readString();
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_7697 = false;
            _productName = null;
            _SafeStr_7698 = null;
            _SafeStr_7137 = null;
            return (true);
        }

        public function get doorOpened():Boolean
        {
            return (_SafeStr_7697);
        }

        public function get productName():String
        {
            return (_productName);
        }

        public function get customImage():String
        {
            return (_SafeStr_7698);
        }

        public function get furnitureClassName():String
        {
            return (_SafeStr_7137);
        }


    }
}//package _-w1X

// _SafeStr_1045 = "_-oJ" (String#9952, DoABC#3)
// _SafeStr_7137 = "_-322" (String#6736, DoABC#3)
// _SafeStr_7697 = "_-3l" (String#6787, DoABC#3)
// _SafeStr_7698 = "_-Ok" (String#8188, DoABC#3)


