import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/models/bank.dart';

List<Bank> banksList = [
  Bank(
      name: 'Access Bank',
      image: 'assets/images/accessbank.png',
      color: kAccessBankColor,
      ussdCode: '*901#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Access Bank Plc. of Nigeria.'),
  Bank(
      name: 'Eco Bank',
      image: 'assets/images/ecobank.png',
      color: kEcoBankColor,
      ussdCode: '*326#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Eco Bank Plc. of Nigeria.'),
  Bank(
      name: 'FCMB',
      image: 'assets/images/fcmbbank.jpg',
      color: kFCMBColor,
      ussdCode: '*389*214#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'First City Monumental Bank of Nigeria.'),
  Bank(
      name: 'Fidelity Bank',
      image: 'assets/images/fidelitybank.jpg',
      color: kFidelityBankColor,
      ussdCode: '*770#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Fidelity Bank of Nigeria.'),
  Bank(
      name: 'First Bank',
      image: 'assets/images/firstbank.png',
      color: kFirstBankColor,
      ussdCode: '*894#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*894#',
        },
        {
          'action': 'Deactivate Mobile Number',
          'code': '*894*911#',
        },
        {
          'action': 'Check Balance',
          'code': '*894*00#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*894*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*894*amount*phoneNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Money Transfers',
          'code': '*894*amount*accountNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Mini Statement',
          'code': '*894*accountNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Open Account',
          'code': '*894*0#',
        },
      ],
      bankInfo: 'First Bank of Nigeria.'),
  Bank(
      name: 'GTB',
      image: 'assets/images/gtbank.png',
      color: kGTBColor,
      ussdCode: '*737#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*737#',
        },
        {
          'action': 'Open Account',
          'code': '*737*0#',
        },
        {
          'action': 'Reactivate Account',
          'code': '*737*11#',
        },
        {
          'action': 'Account Info (BVN, Bal.)',
          'code': '*737*6*1#',
        },
        {
          'action': 'Mini Statement',
          'code': '*737*51*30#',
        },
        {
          'action': '3rd Party Statement',
          'code': '*737*51*33#',
        },
        {
          'action': 'Loan Balances',
          'code': '*737*6*2#',
        },
        {
          'action': 'Card Status',
          'code': '*737*6*3#',
        },
        {
          'action': 'Cheque Book Status',
          'code': '*737*6*4#',
        },
        {
          'action': 'Card Hotlist',
          'code': '*737*51*10#',
        },
        {
          'action': 'Account Blackist',
          'code': '*737*51*74#',
        },
        {
          'action': 'Show/Hide Account Balance on GeNS',
          'code': '*737*51*1#',
        },
        {
          'action': 'Spend To Save',
          'code': '*737*51*24#',
        },
        {
          'action': 'QuickCredit Request',
          'code': '*737*51*51#',
        },
        {
          'action': 'QuickCredit Liquidation',
          'code': '*737*51*55#',
        },
        {
          'action': 'Reference Confirmation',
          'code': '*737*51*54#',
        },
        {
          'action': 'Data Top-up',
          'code': '*737*4#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*737*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*737*amount*phoneNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Money Transfers (GTBank Account)',
          'code': '*737*1*amount*accountNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Money Transfers (Other Banks)',
          'code': '*737*2*amount*accountNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Airtime Advance',
          'code': '*737*8*1#',
        },
        {
          'action': 'School Fees Advance',
          'code': '*737*52*30#',
        },
        {
          'action': 'Salary Advance',
          'code': '*737*8*2#',
        },
        {
          'action': 'PayDay Loan',
          'code': '*737*52*40#',
        },
        {
          'action': 'Create Transaction PIN',
          'code': '*737*5#',
        },
        {
          'action': 'SKS Standing Instruction',
          'code': '*737*52*amount*26#',
          'dialUp': 'no',
        },
        {
          'action': '737 Cashout Service',
          'code': '*737*50*amount*50#',
          'dialUp': 'no',
        },
        {
          'action': 'Cardless Withdrawal',
          'code': '*737*3*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Generate OTP',
          'code': '*737*7#',
        },
        {
          'action': 'Fast Track Withdrawal',
          'code': '*737*49#',
        },
        {
          'action': 'Fast Track Deposit',
          'code': '*737*48*amount*accountNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Cable TV',
          'code': '*737*smartCardNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'StarTimes Subscription',
          'code': '*737*37*amount*decoderNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Pay Merchants',
          'code': '*737*35*amount*merchantCode#',
          'dialUp': 'no',
        },
        {
          'action': 'Pay Bills',
          'code': '*737*50#',
        },
        {
          'action': 'Swift Network Subscription',
          'code': '*737*50*amount*4#',
          'dialUp': 'no',
        },
        {
          'action': 'Pay Electricity Bill',
          'code': '*737*50*amount*code#',
          'dialUp': 'no',
          'phPrepaidCode': '95',
          'phPostpaidCode': '96',
          'ekoPrepaidCode': '151',
          'ekoPostpaidCode': '152',
          'ibadanPrepaidCode': '137',
          'kanoPrepaidCode': '93',
          'kanoPostpaidCode': '94',
        },
        {
          'action': 'LCC Toll Payments',
          'code': '*737*50*amount*108#',
          'dialUp': 'no',
        },
        {
          'action': '737 Edu',
          'code': '*737*31*amount*merchantCode#',
          'dialUp': 'no',
        },
        {
          'action': '737 Give',
          'code': '*737*32*amount*merchantCode#',
          'dialUp': 'no',
        },
      ],
      bankInfo: 'Guaranty Trust Holding Company of Nigeria.'),
  Bank(
      name: 'Heritage Bank',
      image: 'assets/images/heritagebank.png',
      color: kHeritageBankColor,
      ussdCode: '*322*030#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Heritage Bank of Nigeria.'),
  Bank(
      name: 'Jaiz Bank',
      image: 'assets/images/jaizbank.png',
      color: kJaizBankColor,
      ussdCode: '',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Jaiz Bank of Nigeria.'),
  Bank(
      name: 'Keystone',
      image: 'assets/images/keystonebank.png',
      color: kKeystoneBankColor,
      ussdCode: '*322*082#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Keystone Bank of Nigeria.'),
  Bank(
      name: 'Lotus Bank',
      image: 'assets/images/lotusbank.png',
      color: kLotusBankColor,
      ussdCode: '*5045#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*5045#',
        },
        {
          'action': 'Check Balance',
          'code': '*5045*5*1#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*5045*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*5045*amount*phoneNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Money Transfers (Lotus to Lotus)',
          'code': '*5045*amount*accountNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Money Transfers (to other banks)',
          'code': '*5045*3*amount*accountNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Data',
          'code': '*5045*2*#',
        },
      ],
      bankInfo: 'Lotus Bank of Nigeria.'),
  Bank(
      name: 'Polaris Bank',
      image: 'assets/images/polarisbank.png',
      color: kPolarisBankColor,
      ussdCode: '*833#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*833#',
        },
        {
          'action': 'Open Account',
          'code': '*833*1#',
        },
        {
          'action': 'Hotlist Card',
          'code': '*833*4#',
        },
        {
          'action': 'Check Balance',
          'code': '*833*6#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*833*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*833*amount*phoneNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Money Transfers',
          'code': '*833*amount*accountNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Pay Bills',
          'code': '*833*2#',
        },
        {
          'action': 'Pay with MasterPass',
          'code': '*833*7#',
        },
        {
          'action': 'Update BVN',
          'code': '*833*5#',
        },
      ],
      bankInfo: 'Polaris Bank of Nigeria.'),
  Bank(
      name: 'Stanbic IBTC',
      image: 'assets/images/stanbicibtcbank.png',
      color: kStanbicIBTCColor,
      ussdCode: '*909#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Stanbic IBTC of Nigeria.'),
  Bank(
      name: 'Standard Chartered',
      image: 'assets/images/standardbank.png',
      color: kStandardCharteredBankColor,
      ussdCode: '*977#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*977#',
        },
        {
          'action': 'Check Balance',
          'code': '*977*00#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*977*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*977*amount*phoneNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Money Transfers',
          'code': '*977*amount*accountNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Data Subscription (self)',
          'code': '*977*2#',
        },
        {
          'action': 'Data Subscription (others)',
          'code': '*977*2*phoneNumber#',
          'dialUp': 'no',
        },
      ],
      bankInfo: 'Standard Chartered Bank of Nigeria.'),
  Bank(
      name: 'Sterling Bank',
      image: 'assets/images/sterlingbank.png',
      color: kSterlingBankColor,
      ussdCode: '*822#',
      listOfavailableBankUssdOps: [
        {
          'action': 'Main USSD Code',
          'code': '*822#',
        },
        {
          'action': 'Open Account',
          'code': '*822*7#',
        },
        {
          'action': 'Manage Cards',
          'code': '*822*19#',
        },
        {
          'action': 'Check Balance',
          'code': '*822*6#',
        },
        {
          'action': 'Check Account Number',
          'code': '*822*8#',
        },
        {
          'action': 'Buy Airtime (for self)',
          'code': '*822*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'Buy Airtime (for others)',
          'code': '*822*amount*phoneNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Money Transfers',
          'code': '*822*amount*accountNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Cardless Withdrawal',
          'code': '*822*42#',
        },
        {
          'action': 'Pay Bills',
          'code': '*822*2#',
        },
        {
          'action': 'Pay Sterling Merchants',
          'code': '*822*28*amount*merchantCode#',
          'dialUp': 'no',
        },
        {
          'action': 'Pay Coral Pay Merchants',
          'code': '*822*000*refNumber#',
          'dialUp': 'no',
        },
        {
          'action': 'Pay MCash Merchants',
          'code': '*822*22*merchantCode*amount#',
          'dialUp': 'no',
        },
        {
          'action': 'LCC Toll Payments',
          'code': '*822*15#',
        },
      ],
      bankInfo: 'Sterling Bank of Nigeria.'),
  Bank(
      name: 'Taj Bank',
      image: 'assets/images/tajbank.png',
      color: kTajBankColor,
      ussdCode: '*894#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Taj Bank of Nigeria.'),
  Bank(
      name: 'UBA',
      image: 'assets/images/ubabank.png',
      color: kUBAColor,
      ussdCode: '*919#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'United Bank of Africa.'),
  Bank(
      name: 'Union Bank',
      image: 'assets/images/unionbank.png',
      color: kUnionBankColor,
      ussdCode: '*826#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Union Bank of Nigeria.'),
  Bank(
      name: 'Unity Bank',
      image: 'assets/images/unitybank.jpg',
      color: kUnityBankColor,
      ussdCode: '*7799#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Unity Bank of Nigeria.'),
  Bank(
      name: 'Wema Bank',
      image: 'assets/images/wemabank.png',
      color: kWemaBankColor,
      ussdCode: '*945#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Wema Bank of Nigeria.'),
  Bank(
      name: 'Zenith Bank',
      image: 'assets/images/zenithbank.png',
      color: kZenithBankColor,
      ussdCode: '*966#',
      listOfavailableBankUssdOps: [],
      bankInfo: 'Zenith Bank of Nigeria.'),
];
