// pageextension 50000 "Del Sales & Receivables Setup" extends "Sales & Receivables Setup"
// {
//     layout
//     {
//         addbefore("Number Series")
//         {
//             group(Eventos)
//             {
//                 field("Event No Serie"; rec."Event No Serie")
//                 {
//                     ApplicationArea = All;
//                 }

//             }
//         }

//     }
// }