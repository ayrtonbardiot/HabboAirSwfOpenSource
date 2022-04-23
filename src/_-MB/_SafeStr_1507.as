// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-MB._SafeStr_1507

package _-MB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1507 implements IMessageParser 
    {

        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;


        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function flush():Boolean
        {
            _SafeStr_3819 = "";
            _SafeStr_3834 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_3834 = _arg_1.readString();
            if (_SafeStr_3834)
            {
                _SafeStr_3834 = _SafeStr_3834.toUpperCase();
            };
            return (true);
        }


    }
}//package _-MB

// _SafeStr_1507 = "_-a1f" (String#8981, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)


