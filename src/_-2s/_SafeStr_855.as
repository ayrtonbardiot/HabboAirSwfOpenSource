// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-2s._SafeStr_855

package _-2s
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_855 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_855(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean)
        {
            this._SafeStr_6600.push(_arg_1);
            this._SafeStr_6600.push(((_arg_2) ? 1 : 0));
            this._SafeStr_6600.push(((_arg_3) ? 1 : 0));
            this._SafeStr_6600.push(((_arg_4) ? 1 : 0));
        }

        public function getMessageArray():Array
        {
            return (this._SafeStr_6600);
        }

        public function dispose():void
        {
            this._SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-2s

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_855 = "_-lx" (String#9787, DoABC#3)


