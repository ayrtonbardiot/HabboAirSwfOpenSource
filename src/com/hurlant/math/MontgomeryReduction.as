// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.math.MontgomeryReduction

package com.hurlant.math
{
    import com.hurlant.math.BigInteger;
    import com.hurlant.math.bi_internal;
    import com.hurlant.math.*;

    use namespace bi_internal;

    internal class MontgomeryReduction implements IReduction 
    {

        private var m:BigInteger;
        private var _SafeStr_7990:int;
        private var _SafeStr_7991:int;
        private var _SafeStr_7992:int;
        private var _SafeStr_7993:int;
        private var mt2:int;

        public function MontgomeryReduction(_arg_1:BigInteger)
        {
            this.m = _arg_1;
            _SafeStr_7990 = _arg_1.invDigit();
            _SafeStr_7991 = (_SafeStr_7990 & 0x7FFF);
            _SafeStr_7992 = (_SafeStr_7990 >> 15);
            _SafeStr_7993 = 32767;
            mt2 = (2 * _arg_1.t);
        }

        public function convert(_arg_1:BigInteger):BigInteger
        {
            var _local_2:BigInteger = new BigInteger();
            _arg_1.abs().dlShiftTo(m.t, _local_2);
            _local_2.divRemTo(m, null, _local_2);
            if (((_arg_1.s < 0) && (_local_2.compareTo(BigInteger.ZERO) > 0)))
            {
                m.subTo(_local_2, _local_2);
            };
            return (_local_2);
        }

        public function revert(_arg_1:BigInteger):BigInteger
        {
            var _local_2:BigInteger = new BigInteger();
            _arg_1.copyTo(_local_2);
            reduce(_local_2);
            return (_local_2);
        }

        public function reduce(_arg_1:BigInteger):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            while (_arg_1.t <= mt2)
            {
                _arg_1.a[_arg_1.t++] = 0;
            };
            _local_2 = 0;
            while (_local_2 < m.t)
            {
                _local_3 = (_arg_1.a[_local_2] & 0x7FFF);
                _local_4 = (((_local_3 * _SafeStr_7991) + ((((_local_3 * _SafeStr_7992) + ((_arg_1.a[_local_2] >> 15) * _SafeStr_7991)) & _SafeStr_7993) << 15)) & 0x3FFFFFFF);
                _local_3 = (_local_2 + m.t);
                var _local_5:* = _local_3;
                var _local_6:* = (_arg_1.a[_local_5] + m.am(0, _local_4, _arg_1, _local_2, 0, m.t));
                _arg_1.a[_local_5] = _local_6;
                while (_arg_1.a[_local_3] >= 0x40000000)
                {
                    _local_6 = _local_3;
                    _local_5 = (_arg_1.a[_local_6] - 0x40000000);
                    _arg_1.a[_local_6] = _local_5;
                    _arg_1.a[++_local_3]++;
                };
                _local_2++;
            };
            _arg_1.clamp();
            _arg_1.drShiftTo(m.t, _arg_1);
            if (_arg_1.compareTo(m) >= 0)
            {
                _arg_1.subTo(m, _arg_1);
            };
        }

        public function sqrTo(_arg_1:BigInteger, _arg_2:BigInteger):void
        {
            _arg_1.squareTo(_arg_2);
            reduce(_arg_2);
        }

        public function mulTo(_arg_1:BigInteger, _arg_2:BigInteger, _arg_3:BigInteger):void
        {
            _arg_1.multiplyTo(_arg_2, _arg_3);
            reduce(_arg_3);
        }


    }
}//package com.hurlant.math

// _SafeStr_7990 = "_-41i" (String#6828, DoABC#3)
// _SafeStr_7991 = "_-Ea" (String#7512, DoABC#3)
// _SafeStr_7992 = "_-s1W" (String#10190, DoABC#3)
// _SafeStr_7993 = "_-T0" (String#8470, DoABC#3)


