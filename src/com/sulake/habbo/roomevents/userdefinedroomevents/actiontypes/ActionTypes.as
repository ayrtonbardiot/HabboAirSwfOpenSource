// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes.ActionTypes

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents._SafeStr_3326;
    import com.sulake.habbo.roomevents.userdefinedroomevents._SafeStr_3285;
    import _-l12._SafeStr_1593;
    import _-l12._SafeStr_1554;

    public class ActionTypes implements _SafeStr_3326 
    {

        private var _SafeStr_6283:Array = [];

        public function ActionTypes()
        {
            this._SafeStr_6283.push(new _SafeStr_3457());
            this._SafeStr_6283.push(new Reset());
            this._SafeStr_6283.push(new _SafeStr_3436());
            this._SafeStr_6283.push(new _SafeStr_3453());
            this._SafeStr_6283.push(new GiveScore());
            this._SafeStr_6283.push(new _SafeStr_3451());
            this._SafeStr_6283.push(new _SafeStr_3449());
            this._SafeStr_6283.push(new _SafeStr_3434());
            this._SafeStr_6283.push(new _SafeStr_3426());
            this._SafeStr_6283.push(new _SafeStr_3470());
            this._SafeStr_6283.push(new _SafeStr_3419());
            this._SafeStr_6283.push(new MoveToDirection());
            this._SafeStr_6283.push(new _SafeStr_3406());
            this._SafeStr_6283.push(new _SafeStr_3450());
            this._SafeStr_6283.push(new _SafeStr_3393());
            this._SafeStr_6283.push(new _SafeStr_3440());
            this._SafeStr_6283.push(new _SafeStr_3409());
            this._SafeStr_6283.push(new KickFromRoom());
            this._SafeStr_6283.push(new _SafeStr_3468());
            this._SafeStr_6283.push(new _SafeStr_3474());
            this._SafeStr_6283.push(new _SafeStr_3438());
            this._SafeStr_6283.push(new _SafeStr_3460());
            this._SafeStr_6283.push(new _SafeStr_3467());
            this._SafeStr_6283.push(new _SafeStr_3448());
            this._SafeStr_6283.push(new _SafeStr_3416());
            this._SafeStr_6283.push(new _SafeStr_3399());
        }

        public function get types():Array
        {
            return (_SafeStr_6283);
        }

        public function getByCode(_arg_1:int):ActionType
        {
            for each (var _local_2:ActionType in _SafeStr_6283)
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
            return (!((_arg_1 as _SafeStr_1593) == null));
        }

        public function getKey():String
        {
            return ("action");
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_1593 = "_-S8" (String#7622, DoABC#4)
// _SafeStr_3285 = "_-j1k" (String#3139, DoABC#4)
// _SafeStr_3326 = "_-L17" (String#8542, DoABC#4)
// _SafeStr_3393 = "_-417" (String#14704, DoABC#4)
// _SafeStr_3399 = "_-IW" (String#14399, DoABC#4)
// _SafeStr_3406 = "_-R1e" (String#13992, DoABC#4)
// _SafeStr_3409 = "_-Hf" (String#14371, DoABC#4)
// _SafeStr_3416 = "_-8A" (String#14910, DoABC#4)
// _SafeStr_3419 = "_-oe" (String#15436, DoABC#4)
// _SafeStr_3426 = "_-jg" (String#15605, DoABC#4)
// _SafeStr_3434 = "_-8O" (String#15753, DoABC#4)
// _SafeStr_3436 = "_-nV" (String#14729, DoABC#4)
// _SafeStr_3438 = "_-y11" (String#14153, DoABC#4)
// _SafeStr_3440 = "_-T1A" (String#14449, DoABC#4)
// _SafeStr_3448 = "_-Z11" (String#15352, DoABC#4)
// _SafeStr_3449 = "_-m" (String#13890, DoABC#4)
// _SafeStr_3450 = "_-Pv" (String#15167, DoABC#4)
// _SafeStr_3451 = "_-G1y" (String#15404, DoABC#4)
// _SafeStr_3453 = "_-91P" (String#15059, DoABC#4)
// _SafeStr_3457 = "_-Es" (String#13880, DoABC#4)
// _SafeStr_3460 = "_-l0" (String#15469, DoABC#4)
// _SafeStr_3467 = "_-6h" (String#14920, DoABC#4)
// _SafeStr_3468 = "_-V7" (String#14016, DoABC#4)
// _SafeStr_3470 = "_-S1L" (String#14158, DoABC#4)
// _SafeStr_3474 = "_-D1E" (String#14868, DoABC#4)
// _SafeStr_6283 = "_-q1v" (String#1597, DoABC#4)


