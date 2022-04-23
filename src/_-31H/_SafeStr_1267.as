// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-31H._SafeStr_1267

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ja._SafeStr_1634;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1267 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1634;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_3740 = new _SafeStr_1634(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1634
        {
            return (_SafeStr_3740);
        }


    }
}//package _-31H

// _SafeStr_1267 = "_-2t" (String#6706, DoABC#3)
// _SafeStr_1634 = "_-I1T" (String#7726, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


