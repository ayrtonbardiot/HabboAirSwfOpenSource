// by nota

//_-3D._SafeStr_1326

package _-3D
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-41O._SafeStr_1607;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1326 implements IMessageParser 
    {

        private var _SafeStr_5972:_SafeStr_1607;
        private var _SafeStr_7065:Boolean;


        public function flush():Boolean
        {
            _SafeStr_5972 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5972 = new _SafeStr_1607(_arg_1);
            _SafeStr_7065 = _arg_1.readBoolean();
            return (true);
        }

        public function get questData():_SafeStr_1607
        {
            return (_SafeStr_5972);
        }

        public function get showDialog():Boolean
        {
            return (_SafeStr_7065);
        }


    }
}//package _-3D

// _SafeStr_1326 = "_-41r" (String#6835, DoABC#3)
// _SafeStr_1607 = "_-oH" (String#9950, DoABC#3)
// _SafeStr_5972 = "_-OW" (String#8182, DoABC#3)
// _SafeStr_7065 = "_-q15" (String#10033, DoABC#3)


