// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1C._SafeStr_1313

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-n1H._SafeStr_1628;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1313 implements IMessageParser 
    {

        private var _flatId:int;
        private var _SafeStr_3740:_SafeStr_1628;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._flatId = _arg_1.readInteger();
            this._SafeStr_3740 = new _SafeStr_1628(_arg_1);
            return (true);
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get data():_SafeStr_1628
        {
            return (_SafeStr_3740);
        }


    }
}//package _-Z1C

// _SafeStr_1313 = "_-O1K" (String#8139, DoABC#3)
// _SafeStr_1628 = "_-m19" (String#9794, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


