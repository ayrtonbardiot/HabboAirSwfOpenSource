﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.math.IReduction

package com.hurlant.math
{
    import com.hurlant.math.BigInteger;

    internal /*dynamic*/ interface IReduction 
    {

        function convert(_arg_1:BigInteger):BigInteger;
        function revert(_arg_1:BigInteger):BigInteger;
        function reduce(_arg_1:BigInteger):void;
        function mulTo(_arg_1:BigInteger, _arg_2:BigInteger, _arg_3:BigInteger):void;
        function sqrTo(_arg_1:BigInteger, _arg_2:BigInteger):void;

    }
}//package com.hurlant.math
