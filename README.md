Rubytop
-------

Shows object/memory changes of a running jruby app.

It's really rough around the edges at this point

	 Name  5                                                    ints   idelt   bytes       bytes del   sidelt sbytes del
	-----------------------------------------------------------------------------------------------------------------------
	[Lorg.jruby.internal.runtime.methods.DynamicMethod$NativeCa 54529  0      3053624      0            0      0
	org.jruby.util.ByteList                                     58250  -27    2330000      -1080        0      0
	org.jruby.lexer.yacc.SimpleSourcePosition                   68938  0      1654512      0            0      0
	org.jruby.RubyString                                        40951  -42    1638040      -1680        0      0
	org.jruby.internal.runtime.methods.InterpretedMethod        16549  0      1456312      0            0      0
	org.jruby.ast.NewlineNode                                   57384  0      1377216      0            0      0
	org.jruby.internal.runtime.methods.DefaultMethod            15963  0      1277040      0            0      0
	org.jruby.runtime.callsite.NormalCachingCallSite            53018  0      1272432      0            0      0
	org.jruby.ast.ArrayNode                                     48791  0      1170984      0            0      0
	[Lorg.jruby.runtime.builtin.IRubyObject;                    21609  -5     1169816      -80          0      0
	org.jruby.RubyArray                                         21934  -7     1052832      -336         0      0
	org.jruby.parser.LocalStaticScope                           20747  0      995856       0            0      0
	org.jruby.ast.ArgsNoArgNode                                 11932  0      954560       0            0      0
	org.jruby.RubyHash$RubyHashEntry                            22240  -20    889600       -800         0      0
	org.jruby.ast.LocalVarNode                                  34118  0      818832       0            0      0
	org.jruby.ast.CallNoArgNode                                 22962  0      734784       0            0      0
	org.jruby.RubyClass$VariableAccessorField                   29804  0      715296       0            0      0
	org.jruby.IncludedModuleWrapper                             3533   0      706600       0            0      0
	org.jruby.ast.CallOneArgNode                                16647  0      665880       0            0      0
	org.jruby.runtime.callsite.FunctionalCachingCallSite        25180  0      604320       0            0      0
	org.jruby.parser.BlockStaticScope                           10578  0      592368       0            0      0
	org.jruby.ast.ArgsPreOneArgNode                             6259   0      500720       0            0      0
	org.jruby.runtime.callsite.CacheEntry                       19392  0      465408       0            0      0
	org.jruby.MetaClass                                         2267   0      453400       0            0      0
	org.jruby.RubySymbol                                        10890  0      435600       0            0      0
	org.jruby.internal.runtime.methods.DefaultMethod$DynamicMet 15730  0      377520       0            0      0
	org.jruby.runtime.Interpreted19Block                        6658   0      372848       0            0      0
	org.jruby.runtime.callsite.VariableCachingCallSite          15319  0      367656       0            0      0
	org.jruby.RubySymbol$SymbolTable$SymbolEntry                10890  0      348480       0            0      0
	org.jruby.ast.IfNode                                        10591  0      338912       0            0      0
	[Lorg.jruby.runtime.CallSite;                               9370   0      328888       0            0      0
	org.jruby.ast.ArgsNode                                      4063   0      325040       0            0      0
	org.jruby.internal.runtime.methods.ProcMethod               5000   0      320000       0            0      0
	org.jruby.RubyClass                                         1650   0      316800       0            0      0
	org.jruby.internal.runtime.methods.AliasMethod              4930   0      315520       0            0      0
	org.jruby.ast.ConstNode                                     9760   0      312320       0            0      0
	org.jruby.RubyFixnum                                        7537   -3     301480       -120         0      0
	org.jruby.ast.SymbolNode                                    12342  0      296208       0            0      0
	org.jruby.ast.ArgumentNode                                  11859  0      284616       0            0      0
	org.jruby.ast.LocalAsgnNode                                 8847   0      283104       0            0      0
	org.jruby.ast.BlockNode                                     11632  0      279168       0            0      0
	org.jruby.runtime.Frame                                     6972   2      278880       80           0      0
	org.jruby.runtime.Binding                                   5692   2      273216       96           0      0
	org.jruby.ast.VCallNode                                     11105  0      266520       0            0      0
	org.jruby.ast.StrNode                                       10755  0      258120       0            0      0
	org.jruby.ast.IterNode                                      6364   0      254560       0            0      0
