// by nota

//_-PB._SafeStr_1147

package _-PB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1147 implements IMessageParser 
    {

        private var _SafeStr_5431:int;
        private var _name:String;
        private var _SafeStr_3623:int;
        private var _SafeStr_6073:int;
        private var _SafeStr_4374:int;
        private var _SafeStr_5925:int;
        private var _nutrition:int;
        private var _SafeStr_7492:int;
        private var _SafeStr_7493:int;
        private var _SafeStr_7494:int;
        private var _SafeStr_6429:int;
        private var _SafeStr_5226:int;
        private var _ownerName:String;
        private var _SafeStr_5918:int;
        private var _SafeStr_5919:int;
        private var _SafeStr_5920:Boolean;
        private var _SafeStr_4378:Boolean;
        private var _SafeStr_5690:Boolean;
        private var _SafeStr_5820:Boolean;
        private var _SafeStr_5821:Boolean;
        private var _SafeStr_5929:int;
        private var _SafeStr_5930:int;
        private var _SafeStr_5931:int;
        private var _SafeStr_5921:Array;
        private var _SafeStr_5922:int;
        private var _SafeStr_5609:int;
        private var _hasBreedingPermission:Boolean;


        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }

        public function get maxLevel():int
        {
            return (_SafeStr_6073);
        }

        public function get experience():int
        {
            return (_SafeStr_4374);
        }

        public function get energy():int
        {
            return (_SafeStr_5925);
        }

        public function get nutrition():int
        {
            return (_nutrition);
        }

        public function get experienceRequiredToLevel():int
        {
            return (_SafeStr_7492);
        }

        public function get maxEnergy():int
        {
            return (_SafeStr_7493);
        }

        public function get maxNutrition():int
        {
            return (_SafeStr_7494);
        }

        public function get respect():int
        {
            return (_SafeStr_6429);
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function get age():int
        {
            return (_SafeStr_5918);
        }

        public function get breedId():int
        {
            return (_SafeStr_5919);
        }

        public function get hasFreeSaddle():Boolean
        {
            return (_SafeStr_5920);
        }

        public function get isRiding():Boolean
        {
            return (_SafeStr_4378);
        }

        public function get canBreed():Boolean
        {
            return (_SafeStr_5690);
        }

        public function get canHarvest():Boolean
        {
            return (_SafeStr_5820);
        }

        public function get canRevive():Boolean
        {
            return (_SafeStr_5821);
        }

        public function get maxWellBeingSeconds():int
        {
            return (_SafeStr_5929);
        }

        public function get remainingWellBeingSeconds():int
        {
            return (_SafeStr_5930);
        }

        public function get remainingGrowingSeconds():int
        {
            return (_SafeStr_5931);
        }

        public function get skillTresholds():Array
        {
            return (_SafeStr_5921);
        }

        public function get accessRights():int
        {
            return (_SafeStr_5922);
        }

        public function get rarityLevel():int
        {
            return (_SafeStr_5609);
        }

        public function get hasBreedingPermission():Boolean
        {
            return (_hasBreedingPermission);
        }

        public function flush():Boolean
        {
            _SafeStr_5431 = -1;
            _SafeStr_5921 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_5431 = _arg_1.readInteger();
            _name = _arg_1.readString();
            _SafeStr_3623 = _arg_1.readInteger();
            _SafeStr_6073 = _arg_1.readInteger();
            _SafeStr_4374 = _arg_1.readInteger();
            _SafeStr_7492 = _arg_1.readInteger();
            _SafeStr_5925 = _arg_1.readInteger();
            _SafeStr_7493 = _arg_1.readInteger();
            _nutrition = _arg_1.readInteger();
            _SafeStr_7494 = _arg_1.readInteger();
            _SafeStr_6429 = _arg_1.readInteger();
            _SafeStr_5226 = _arg_1.readInteger();
            _SafeStr_5918 = _arg_1.readInteger();
            _ownerName = _arg_1.readString();
            _SafeStr_5919 = _arg_1.readInteger();
            _SafeStr_5920 = _arg_1.readBoolean();
            _SafeStr_4378 = _arg_1.readBoolean();
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_5921.push(_arg_1.readInteger());
                _local_2++;
            };
            _SafeStr_5921.sort(16);
            _SafeStr_5922 = _arg_1.readInteger();
            _SafeStr_5690 = _arg_1.readBoolean();
            _SafeStr_5820 = _arg_1.readBoolean();
            _SafeStr_5821 = _arg_1.readBoolean();
            _SafeStr_5609 = _arg_1.readInteger();
            _SafeStr_5929 = _arg_1.readInteger();
            _SafeStr_5930 = _arg_1.readInteger();
            _SafeStr_5931 = _arg_1.readInteger();
            _hasBreedingPermission = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-PB

// _SafeStr_1147 = "_-z1y" (String#10678, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_4374 = "_-j1L" (String#9597, DoABC#3)
// _SafeStr_4378 = "_-a1j" (String#8985, DoABC#3)
// _SafeStr_5226 = "_-Ld" (String#7981, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_5609 = "_-l1V" (String#9749, DoABC#3)
// _SafeStr_5690 = "_-e1I" (String#9269, DoABC#3)
// _SafeStr_5820 = "_-m1s" (String#9816, DoABC#3)
// _SafeStr_5821 = "_-j1t" (String#9611, DoABC#3)
// _SafeStr_5918 = "_-q1i" (String#10058, DoABC#3)
// _SafeStr_5919 = "_-e1Z" (String#9277, DoABC#3)
// _SafeStr_5920 = "_-vt" (String#10429, DoABC#3)
// _SafeStr_5921 = "_-C1x" (String#7377, DoABC#3)
// _SafeStr_5922 = "_-O7" (String#8170, DoABC#3)
// _SafeStr_5925 = "_-71Q" (String#7017, DoABC#3)
// _SafeStr_5929 = "_-R1r" (String#8358, DoABC#3)
// _SafeStr_5930 = "_-s9" (String#10211, DoABC#3)
// _SafeStr_5931 = "_-u1j" (String#10322, DoABC#3)
// _SafeStr_6073 = "_-Ga" (String#7636, DoABC#3)
// _SafeStr_6429 = "_-x0" (String#10501, DoABC#3)
// _SafeStr_7492 = "_-c11" (String#9102, DoABC#3)
// _SafeStr_7493 = "_-e11" (String#9262, DoABC#3)
// _SafeStr_7494 = "_-n7" (String#9894, DoABC#3)


