// by nota

//_-z1k._SafeStr_1275

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1275 implements IMessageParser 
    {

        private var _SafeStr_4110:String;
        private var _SafeStr_4862:int;
        private var _SafeStr_4838:String;
        private var _SafeStr_4951:int;
        private var _SafeStr_4953:String;
        private var _placedInRoom:Boolean;
        private var _petFigureString:String;


        public function get itemType():String
        {
            return (_SafeStr_4110);
        }

        public function get classId():int
        {
            return (_SafeStr_4862);
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get placedItemId():int
        {
            return (_SafeStr_4951);
        }

        public function get placedItemType():String
        {
            return (_SafeStr_4953);
        }

        public function get placedInRoom():Boolean
        {
            return (_placedInRoom);
        }

        public function get petFigureString():String
        {
            return (_petFigureString);
        }

        public function flush():Boolean
        {
            _SafeStr_4110 = "";
            _SafeStr_4862 = 0;
            _SafeStr_4838 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4110 = _arg_1.readString();
            _SafeStr_4862 = _arg_1.readInteger();
            _SafeStr_4838 = _arg_1.readString();
            _SafeStr_4951 = _arg_1.readInteger();
            _SafeStr_4953 = _arg_1.readString();
            _placedInRoom = _arg_1.readBoolean();
            _petFigureString = _arg_1.readString();
            return (true);
        }


    }
}//package _-z1k

// _SafeStr_1275 = "_-JR" (String#7801, DoABC#3)
// _SafeStr_4110 = "_-BF" (String#7329, DoABC#3)
// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)
// _SafeStr_4862 = "_-Q1H" (String#8290, DoABC#3)
// _SafeStr_4951 = "_-A7" (String#7241, DoABC#3)
// _SafeStr_4953 = "_-s13" (String#10177, DoABC#3)


