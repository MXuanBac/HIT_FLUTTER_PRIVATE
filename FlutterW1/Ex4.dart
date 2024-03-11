String astrologicalSignNames(int day, String month) {
  if((day>=21 && day <=31 && month=="Mar")||(day>=1 && day <=20 && month=="Mar")) {
    return "Aries";
  }
  else if((day>=21 && day <=30 && month=="Apr")||(day>=1 && day <=20 && month=="May")) {
    return "Taurus";
  }
  else if((day>=21 && day <=31 && month=="May")||(day>=1 && day <=21 && month=="Jun")) {
    return "Gemini";
  }
  else if((day>=22 && day <=30 && month=="Jun")||(day>=1 && day <=22 && month=="Jul")) {
    return "Cancer";
  }
  else if((day>=23 && day <=31 && month=="Jul")||(day>=1 && day <=22 && month=="Aug")) {
    return "Leo";
  }
  else if((day>=23 && day <=31 && month=="Aug")||(day>=1 && day <=21 && month=="Sep")) {
    return "Virgo";
  }
  else if((day>=22 && day <=30 && month=="Sep")||(day>=1 && day <=22 && month=="Oct")) {
    return "Libra";
  }
  else if((day>=23 && day <=31 && month=="Oct")||(day>=1 && day <=22 && month=="Nov")) {
    return "Scorpio";
  }
  else if((day>=21 && day <=30 && month=="Nov")||(day>=1 && day <=21 && month=="Dec")) {
    return "Sagittarius";
  }
  else if((day>=22 && day <=31 && month=="Dec")||(day>=1 && day <=20 && month=="Jan")) {
    return "Capricorn";
  }
  else if((day>=21 && day <=31 && month=="Jan")||(day>=1 && day <=19 && month=="Feb")) {
    return "Aquarius";
  }
  else if((day>=20 && day <=29 && month=="Feb")||(day>=1 && day <=20 && month=="Mar")) {
    return "Pisces";
  }
  return "Error";
}

void main(List<String> args) {
  print(astrologicalSignNames(20, 'Sep'));
}