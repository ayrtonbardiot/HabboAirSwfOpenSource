// by nota

//_-p1Y._SafeStr_517

package _-p1Y
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_517 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_517(_arg_1:Array)
        {
            var _local_2:int;
            super();
            this._SafeStr_6600.push(_arg_1.length);
            _local_2 = 0;
            while (_local_2 < _arg_1.length)
            {
                this._SafeStr_6600.push(_arg_1[_local_2]);
                _local_2++;
            };
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
}//package _-p1Y

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_517 = "_-12l" (String#6580, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


