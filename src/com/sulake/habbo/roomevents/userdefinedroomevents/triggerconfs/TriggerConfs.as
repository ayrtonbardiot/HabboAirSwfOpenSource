// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.TriggerConfs

package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.habbo.roomevents.userdefinedroomevents._SafeStr_3326;
    import com.sulake.habbo.roomevents.userdefinedroomevents._SafeStr_3285;
    import _-l12._SafeStr_1592;
    import _-l12._SafeStr_1554;

    public class TriggerConfs implements _SafeStr_3326 
    {

        private var _SafeStr_5897:Array = [];

        public function TriggerConfs()
        {
            this._SafeStr_5897.push(new _SafeStr_3443());
            this._SafeStr_5897.push(new _SafeStr_3447());
            this._SafeStr_5897.push(new _SafeStr_3429());
            this._SafeStr_5897.push(new _SafeStr_3287());
            this._SafeStr_5897.push(new _SafeStr_3430());
            this._SafeStr_5897.push(new _SafeStr_3407());
            this._SafeStr_5897.push(new AvatarEntersRoom());
            this._SafeStr_5897.push(new _SafeStr_3405());
            this._SafeStr_5897.push(new _SafeStr_3445());
            this._SafeStr_5897.push(new ScoreAchieved());
            this._SafeStr_5897.push(new _SafeStr_3413());
            this._SafeStr_5897.push(new _SafeStr_3403());
            this._SafeStr_5897.push(new _SafeStr_3408());
            this._SafeStr_5897.push(new _SafeStr_3428());
            this._SafeStr_5897.push(new _SafeStr_3401());
        }

        public function get confs():Array
        {
            return (_SafeStr_5897);
        }

        public function getByCode(_arg_1:int):_SafeStr_3286
        {
            for each (var _local_2:_SafeStr_3286 in _SafeStr_5897)
            {
                if (_local_2.code == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getElementByCode(_arg_1:int):_SafeStr_3285
        {
            return (getByCode(_arg_1));
        }

        public function acceptTriggerable(_arg_1:_SafeStr_1554):Boolean
        {
            return (!((_arg_1 as _SafeStr_1592) == null));
        }

        public function getKey():String
        {
            return ("trigger");
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_1592 = "_-22A" (String#13704, DoABC#4)
// _SafeStr_3285 = "_-j1k" (String#3139, DoABC#4)
// _SafeStr_3286 = "_-C1W" (String#11131, DoABC#4)
// _SafeStr_3287 = "_-02y" (String#7463, DoABC#4)
// _SafeStr_3326 = "_-L17" (String#8542, DoABC#4)
// _SafeStr_3401 = "_-eE" (String#15067, DoABC#4)
// _SafeStr_3403 = "_-J1G" (String#15755, DoABC#4)
// _SafeStr_3405 = "_-M1W" (String#15288, DoABC#4)
// _SafeStr_3407 = "_-c1T" (String#10367, DoABC#4)
// _SafeStr_3408 = "_-1r" (String#15219, DoABC#4)
// _SafeStr_3413 = "_-2d" (String#15299, DoABC#4)
// _SafeStr_3428 = "_-oP" (String#14695, DoABC#4)
// _SafeStr_3429 = "_-j1s" (String#14076, DoABC#4)
// _SafeStr_3430 = "_-9y" (String#15423, DoABC#4)
// _SafeStr_3443 = "_-v1t" (String#14151, DoABC#4)
// _SafeStr_3445 = "_-F1L" (String#15408, DoABC#4)
// _SafeStr_3447 = "_-Q1c" (String#14223, DoABC#4)
// _SafeStr_5897 = "_-h7" (String#3829, DoABC#4)


