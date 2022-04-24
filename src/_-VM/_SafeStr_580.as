// by nota

//_-VM._SafeStr_580

package _-VM
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_580 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [0];


        public function add(_arg_1:int, _arg_2:int, _arg_3:Boolean):void
        {
            _SafeStr_6600.push(_arg_1, _arg_2, _arg_3);
            _SafeStr_6600[0]++;
        }

        public function getMessageArray():Array
        {
            return (this._SafeStr_6600);
        }

        public function get size():int
        {
            return (_SafeStr_6600[0]);
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
}//package _-VM

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_580 = "_-Nu" (String#8123, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


