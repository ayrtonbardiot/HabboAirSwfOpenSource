// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-VM._SafeStr_538

package _-VM
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_538 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_538(_arg_1:int, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean)
        {
            this._SafeStr_6600 = [_arg_1, _arg_2, _arg_4, _arg_3];
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

        public function unwatch(_arg_1:String):void
        {
            super.unwatch(_arg_1);
        }


    }
}//package _-VM

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_538 = "_-e1l" (String#9284, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


